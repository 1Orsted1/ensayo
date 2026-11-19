import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/domain/plan/piece_validation.dart';
import 'package:ensayo/domain/session/piece_log_validation.dart';
import 'package:ensayo/domain/session/piece_mood.dart';
import 'package:reactive_forms/reactive_forms.dart';

abstract final class PieceLogFormFields {
  static const mood = 'mood';
  static const note = 'note';
  static const duration = 'duration';
  static const tempo = 'tempo';
}

FormGroup buildPieceLogFormGroup(Piece piece) => FormGroup({
  PieceLogFormFields.mood: FormControl<PieceMood?>(),
  PieceLogFormFields.note: FormControl<String>(
    value: '',
    validators: [_noteRule],
  ),
  PieceLogFormFields.duration: FormControl<int>(
    value: minPieceMinutes,
    validators: [_durationRule],
  ),
  PieceLogFormFields.tempo: FormControl<String>(
    value: piece.targetBpm?.toString() ?? '',
    validators: [_tempoRule],
  ),
});

final _durationRule = Validators.delegate((control) {
  final error = validateDuration(control.value as int?);
  return error == null ? null : {error.name: true};
});

final _noteRule = Validators.delegate((control) {
  final error = validateNote(control.value as String? ?? '');
  return error == null ? null : {error.name: true};
});

final _tempoRule = Validators.delegate((control) {
  final error = validateTargetBpm(control.value as String? ?? '');
  return error == null ? null : {error.name: true};
});
