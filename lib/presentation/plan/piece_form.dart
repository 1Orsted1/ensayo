import 'package:ensayo/application/plan/plan_bloc.dart';
import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/domain/plan/plan_action_status.dart';
import 'package:ensayo/domain/plan/plan_load_status.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/plan/piece_form_group.dart';
import 'package:ensayo/presentation/plan/plan_labels.dart';
import 'package:ensayo/presentation/plan/widgets/delete_piece_dialog.dart';
import 'package:ensayo/presentation/plan/widgets/focus_tags_field.dart';
import 'package:ensayo/presentation/plan/widgets/section_label.dart';
import 'package:ensayo/presentation/plan/widgets/status_choice_field.dart';
import 'package:ensayo/presentation/theme/extensions/app_theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// Pops back if the edited piece doesn't exist (e.g. a stale link).
class PieceForm extends StatefulWidget {
  const PieceForm({super.key, this.pieceId});
  final int? pieceId;

  @override
  State<PieceForm> createState() => _PieceFormState();
}

class _PieceFormState extends State<PieceForm> {
  /// Fixed once found, so a reload (e.g. after deleting it) doesn't reset
  /// the form.
  Piece? _piece;

  FormGroup? _form;

  /// Lets the listener ignore actions this form didn't start.
  bool _awaitingResult = false;
  bool _deleting = false;

  bool get _isEditing => widget.pieceId != null;

  @override
  void initState() {
    super.initState();
    if (!_isEditing) {
      _form = buildPieceFormGroup(null);
      return;
    }
    final state = context.read<PlanBloc>().state;
    final piece = _find(state);
    if (piece != null) {
      _piece = piece;
      _form = buildPieceFormGroup(piece);
    } else {
      // Can't pop during initState, so wait for the first frame.
      WidgetsBinding.instance.addPostFrameCallback((_) => _resolve(state));
    }
  }

  @override
  void dispose() {
    _form?.dispose();
    super.dispose();
  }

  Piece? _find(PlanState state) =>
      state.pieces.where((p) => p.id == widget.pieceId).firstOrNull;

  void _resolve(PlanState state) {
    if (!mounted || _form != null) return;
    if (state.loadStatus == PlanLoadStatus.loading) return;
    final piece = _find(state);
    if (piece == null) {
      Navigator.of(context).pop();
      return;
    }
    setState(() {
      _piece = piece;
      _form = buildPieceFormGroup(piece);
    });
  }

  void _save() {
    final form = _form!;
    if (_awaitingResult) return;
    if (!form.valid) {
      form.markAllAsTouched();
      return;
    }
    setState(() {
      _awaitingResult = true;
      _deleting = false;
    });
    context.read<PlanBloc>().add(
      PlanEvent.pieceSaved(pieceFromForm(form, id: _piece?.id)),
    );
  }

  Future<void> _delete() async {
    final confirmed = await DeletePieceDialog.show(context);
    if (!confirmed || !mounted || _awaitingResult) return;
    setState(() {
      _awaitingResult = true;
      _deleting = true;
    });
    context.read<PlanBloc>().add(PlanEvent.pieceDeleted(_piece!.id!));
  }

  void _onActionResult(BuildContext context, PlanState state) {
    if (!_awaitingResult) return;
    switch (state.actionStatus) {
      case PlanActionStatus.success:
        _awaitingResult = false;
        Navigator.of(context).pop();
      case PlanActionStatus.failure:
        setState(() => _awaitingResult = false);
        final t = context.t;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _deleting ? t.plan.failure.delete : t.plan.failure.save,
            ),
          ),
        );
      case PlanActionStatus.idle || PlanActionStatus.inProgress:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final form = _form;

    if (form == null) {
      return BlocListener<PlanBloc, PlanState>(
        listener: (context, state) => _resolve(state),
        child: Scaffold(
          appBar: AppBar(title: Text(t.plan.form.editTitle)),
          body: const Center(child: CircularProgressIndicator()),
        ),
      );
    }

    final busy = _awaitingResult;
    final messages = pieceValidationMessages(t);

    return BlocListener<PlanBloc, PlanState>(
      listenWhen: (previous, current) =>
          previous.actionStatus != current.actionStatus,
      listener: _onActionResult,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _isEditing ? t.plan.form.editTitle : t.plan.form.addTitle,
          ),
        ),
        body: ReactiveForm(
          formGroup: form,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ReactiveTextField<String>(
                  key: const ValueKey('piece-title'),
                  formControlName: PieceFormFields.title,
                  validationMessages: messages,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: t.plan.form.titleLabel,
                  ),
                ),
                const Gap(16),
                ReactiveTextField<String>(
                  key: const ValueKey('piece-composer'),
                  formControlName: PieceFormFields.composer,
                  validationMessages: messages,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: t.plan.form.composerLabel,
                  ),
                ),
                const Gap(24),
                SectionLabel(t.plan.form.statusLabel),
                const StatusChoiceField(
                  formControlName: PieceFormFields.status,
                ),
                const Gap(24),
                ReactiveTextField<String>(
                  key: const ValueKey('piece-tempo'),
                  formControlName: PieceFormFields.tempo,
                  validationMessages: messages,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    labelText: t.plan.form.tempoLabel,
                    suffixText: t.plan.bpmUnit,
                  ),
                ),
                const Gap(24),
                SectionLabel(t.plan.form.tagsLabel),
                const FocusTagsField(formControlName: PieceFormFields.tags),
                const Gap(32),
                FilledButton(
                  onPressed: busy ? null : _save,
                  child: Text(t.plan.form.save),
                ),
                const Gap(8),
                TextButton(
                  onPressed: busy ? null : () => Navigator.of(context).pop(),
                  child: Text(t.plan.form.discard),
                ),
                if (_isEditing) ...[
                  const Gap(24),
                  TextButton.icon(
                    onPressed: busy ? null : _delete,
                    style: TextButton.styleFrom(
                      foregroundColor: context.colorScheme.error,
                    ),
                    icon: const Icon(Icons.delete_outline),
                    label: Text(t.plan.form.delete),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
