import 'package:ensayo/application/plan/plan_bloc.dart';
import 'package:ensayo/domain/plan/focus_tag.dart';
import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/domain/plan/piece_status.dart';
import 'package:ensayo/domain/plan/piece_validation.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/plan/plan_labels.dart';
import 'package:ensayo/presentation/theme/extensions/app_theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

/// Add a piece (no [pieceId]) or edit an existing one.
///
/// When editing, the piece is read from [PlanBloc] by id. If the plan is still
/// loading this shows a spinner; if the piece isn't there, it pops back.
class PieceFormScreen extends StatefulWidget {
  const PieceFormScreen({super.key, this.pieceId});
  final int? pieceId;

  @override
  State<PieceFormScreen> createState() => _PieceFormScreenState();
}

class _PieceFormScreenState extends State<PieceFormScreen> {
  /// The piece being edited. Fixed once found, so the form doesn't react
  /// when the list reloads (for example, right after this piece is deleted).
  Piece? _piece;

  @override
  void initState() {
    super.initState();
    if (widget.pieceId != null) {
      _piece = _find(context.read<PlanBloc>().state);
      // Already loaded but missing: leave once the first frame is up.
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _resolve(context.read<PlanBloc>().state),
      );
    }
  }

  Piece? _find(PlanState state) =>
      state.pieces.where((p) => p.id == widget.pieceId).firstOrNull;

  void _resolve(PlanState state) {
    if (!mounted || _piece != null) return;
    if (state.loadStatus == PlanLoadStatus.loading) return;
    final piece = _find(state);
    if (piece != null) {
      setState(() => _piece = piece);
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.pieceId == null || _piece != null) {
      return _PieceForm(piece: _piece);
    }
    return BlocListener<PlanBloc, PlanState>(
      listener: (context, state) => _resolve(state),
      child: Scaffold(
        appBar: AppBar(title: Text(context.t.plan.form.editTitle)),
        body: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _PieceForm extends StatefulWidget {
  const _PieceForm({required this.piece});

  /// Null when adding a new piece.
  final Piece? piece;

  @override
  State<_PieceForm> createState() => _PieceFormState();
}

class _PieceFormState extends State<_PieceForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _title;
  late final TextEditingController _composer;
  late final TextEditingController _tempo;
  late PieceStatus _status;
  late Set<FocusTag> _tags;

  /// Set when this form dispatches a write, so the listener only reacts to
  /// results of actions started here.
  bool _awaitingResult = false;
  bool _deleting = false;

  bool get _isEditing => widget.piece != null;

  @override
  void initState() {
    super.initState();
    final piece = widget.piece;
    _title = TextEditingController(text: piece?.title);
    _composer = TextEditingController(text: piece?.composer);
    _tempo = TextEditingController(text: piece?.targetBpm?.toString());
    _status = piece?.status ?? PieceStatus.learning;
    _tags = {...?piece?.tags};
  }

  @override
  void dispose() {
    _title.dispose();
    _composer.dispose();
    _tempo.dispose();
    super.dispose();
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    final composer = _composer.text.trim();
    final piece = Piece(
      id: widget.piece?.id,
      title: _title.text.trim(),
      composer: composer.isEmpty ? null : composer,
      status: _status,
      targetBpm: int.tryParse(_tempo.text.trim()),
      tags: _tags,
    );
    setState(() {
      _awaitingResult = true;
      _deleting = false;
    });
    context.read<PlanBloc>().add(PlanPieceSaved(piece));
  }

  Future<void> _confirmDelete() async {
    final t = context.t;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.plan.deleteDialog.title),
        content: Text(t.plan.deleteDialog.body),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(t.plan.deleteDialog.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(t.plan.deleteDialog.confirm),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    setState(() {
      _awaitingResult = true;
      _deleting = true;
    });
    context.read<PlanBloc>().add(PlanPieceDeleted(widget.piece!.id!));
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

  String? _errorText(Translations t, PieceFieldError? error) => switch (error) {
    null => null,
    PieceFieldError.titleRequired => t.plan.validation.titleRequired,
    PieceFieldError.titleTooLong => t.plan.validation.titleTooLong(
      max: maxTitleLength,
    ),
    PieceFieldError.composerTooLong => t.plan.validation.composerTooLong(
      max: maxComposerLength,
    ),
    PieceFieldError.bpmOutOfRange => t.plan.validation.bpmOutOfRange(
      min: minTargetBpm,
      max: maxTargetBpm,
    ),
  };

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final busy = _awaitingResult;

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
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  key: const ValueKey('piece-title'),
                  controller: _title,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: t.plan.form.titleLabel,
                  ),
                  validator: (value) =>
                      _errorText(t, validateTitle(value ?? '')),
                ),
                const Gap(16),
                TextFormField(
                  key: const ValueKey('piece-composer'),
                  controller: _composer,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: t.plan.form.composerLabel,
                  ),
                  validator: (value) =>
                      _errorText(t, validateComposer(value ?? '')),
                ),
                const Gap(24),
                _SectionLabel(t.plan.form.statusLabel),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final status in PieceStatus.values)
                      ChoiceChip(
                        label: Text(statusLabel(t, status)),
                        selected: status == _status,
                        onSelected: (_) => setState(() => _status = status),
                      ),
                  ],
                ),
                const Gap(24),
                TextFormField(
                  key: const ValueKey('piece-tempo'),
                  controller: _tempo,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    labelText: t.plan.form.tempoLabel,
                    suffixText: t.plan.bpmUnit,
                  ),
                  validator: (value) =>
                      _errorText(t, validateTargetBpm(value ?? '')),
                ),
                const Gap(24),
                _SectionLabel(t.plan.form.tagsLabel),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final tag in FocusTag.values)
                      FilterChip(
                        label: Text(focusTagLabel(t, tag)),
                        selected: _tags.contains(tag),
                        onSelected: (selected) => setState(
                          () => selected ? _tags.add(tag) : _tags.remove(tag),
                        ),
                      ),
                  ],
                ),
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
                    onPressed: busy ? null : _confirmDelete,
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

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: context.textStyle.labelSmall?.copyWith(
          color: context.colorScheme.onSurfaceVariant,
          letterSpacing: 0.6,
        ),
      ),
    );
  }
}
