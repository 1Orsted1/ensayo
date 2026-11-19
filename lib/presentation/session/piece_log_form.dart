import 'package:clock/clock.dart';
import 'package:ensayo/application/session/session_bloc.dart';
import 'package:ensayo/domain/session/piece_log.dart';
import 'package:ensayo/domain/session/piece_log_validation.dart';
import 'package:ensayo/domain/session/piece_mood.dart';
import 'package:ensayo/domain/session/session_action_status.dart';
import 'package:ensayo/domain/session/session_rules.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/plan/widgets/section_label.dart';
import 'package:ensayo/presentation/session/piece_log_form_group.dart';
import 'package:ensayo/presentation/session/session_labels.dart';
import 'package:ensayo/presentation/session/widgets/current_piece_header.dart';
import 'package:ensayo/presentation/session/widgets/duration_slider_field.dart';
import 'package:ensayo/presentation/session/widgets/mood_picker_field.dart';
import 'package:ensayo/presentation/session/widgets/tempo_stepper_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PieceLogForm extends StatefulWidget {
  const PieceLogForm({super.key});

  @override
  State<PieceLogForm> createState() => _PieceLogFormState();
}

class _PieceLogFormState extends State<PieceLogForm> {
  late FormGroup _form;

  @override
  void initState() {
    super.initState();
    _form = buildPieceLogFormGroup(
      context.read<SessionBloc>().state.currentPiece!,
    );
  }

  @override
  void dispose() {
    _form.dispose();
    super.dispose();
  }

  void _reset(SessionState state) {
    final piece = state.currentPiece;
    if (piece == null) return;
    _form.dispose();
    setState(() => _form = buildPieceLogFormGroup(piece));
  }

  void _submit() {
    if (!_form.valid) {
      _form.markAllAsTouched();
      return;
    }
    final bloc = context.read<SessionBloc>();
    final state = bloc.state;
    if (state.currentPiece == null) return;

    final durationControl =
        _form.control(PieceLogFormFields.duration) as FormControl<int>;
    final minutes = durationControl.pristine
        ? suggestedPieceMinutes(clock.now().difference(state.currentSince))
        : durationControl.value ?? minPieceMinutes;
    final note = (_form.control(PieceLogFormFields.note).value as String? ?? '')
        .trim();
    final tempoText =
        (_form.control(PieceLogFormFields.tempo).value as String? ?? '').trim();

    bloc.add(
      SessionEvent.pieceLogged(
        PieceLogInput(
          minutes: minutes,
          mood: _form.control(PieceLogFormFields.mood).value as PieceMood?,
          tempoBpm: int.tryParse(tempoText),
          note: note.isEmpty ? null : note,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return BlocConsumer<SessionBloc, SessionState>(
      listenWhen: (previous, current) =>
          previous.currentIndex != current.currentIndex &&
          current.actionStatus == SessionActionStatus.idle,
      listener: (context, state) => _reset(state),
      builder: (context, state) {
        final piece = state.currentPiece;
        if (piece == null) return const SizedBox.shrink();
        final busy = state.actionStatus == SessionActionStatus.inProgress;
        return ReactiveForm(
          formGroup: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CurrentPieceHeader(
                piece: piece,
                currentIndex: state.currentIndex,
                total: state.queue.length,
              ),
              const SizedBox(height: 24),
              SectionLabel(t.session.moodLabel),
              const MoodPickerField(formControlName: PieceLogFormFields.mood),
              const SizedBox(height: 24),
              SectionLabel(t.session.noteLabel),
              ReactiveTextField<String>(
                key: const ValueKey('piece-note-input'),
                formControlName: PieceLogFormFields.note,
                validationMessages: pieceLogValidationMessages(t),
                maxLines: 4,
                decoration: InputDecoration(hintText: t.session.noteHint),
              ),
              const SizedBox(height: 24),
              SectionLabel(t.session.durationLabel),
              DurationSliderField(
                formControlName: PieceLogFormFields.duration,
                currentSince: state.currentSince,
              ),
              const SizedBox(height: 24),
              SectionLabel(t.session.tempoLabel),
              const TempoStepperField(
                formControlName: PieceLogFormFields.tempo,
              ),
              const SizedBox(height: 24),
              FilledButton(
                key: const ValueKey('log-piece-button'),
                onPressed: busy ? null : _submit,
                child: Text(t.session.logAndContinue),
              ),
              TextButton(
                key: const ValueKey('skip-piece-button'),
                onPressed: busy
                    ? null
                    : () => context.read<SessionBloc>().add(
                        const SessionEvent.pieceSkipped(),
                      ),
                child: Text(t.session.skip),
              ),
            ],
          ),
        );
      },
    );
  }
}
