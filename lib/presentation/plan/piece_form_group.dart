import 'package:ensayo/domain/plan/focus_tag.dart';
import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/domain/plan/piece_status.dart';
import 'package:ensayo/domain/plan/piece_validation.dart';
import 'package:reactive_forms/reactive_forms.dart';

abstract final class PieceFormFields {
  static const title = 'title';
  static const composer = 'composer';
  static const tempo = 'tempo';
  static const status = 'status';
  static const tags = 'tags';
}

/// Text controls keep the raw input, so the domain validators decide
/// what's valid instead of a parser.
FormGroup buildPieceFormGroup(Piece? piece) => FormGroup({
  PieceFormFields.title: FormControl<String>(
    value: piece?.title ?? '',
    validators: [_rule(validateTitle)],
  ),
  PieceFormFields.composer: FormControl<String>(
    value: piece?.composer ?? '',
    validators: [_rule(validateComposer)],
  ),
  PieceFormFields.tempo: FormControl<String>(
    value: piece?.targetBpm?.toString() ?? '',
    validators: [_rule(validateTargetBpm)],
  ),
  PieceFormFields.status: FormControl<PieceStatus>(
    value: piece?.status ?? PieceStatus.learning,
  ),
  PieceFormFields.tags: FormControl<Set<FocusTag>>(value: {...?piece?.tags}),
});

Piece pieceFromForm(FormGroup form, {int? id}) {
  String text(String name) =>
      (form.control(name).value as String? ?? '').trim();
  final composer = text(PieceFormFields.composer);
  return Piece(
    id: id,
    title: text(PieceFormFields.title),
    composer: composer.isEmpty ? null : composer,
    status: form.control(PieceFormFields.status).value as PieceStatus,
    targetBpm: int.tryParse(text(PieceFormFields.tempo)),
    tags: {...form.control(PieceFormFields.tags).value as Set<FocusTag>},
  );
}

/// Error keys are [PieceFieldError] names so `pieceValidationMessages`
/// can translate them.
Validator<dynamic> _rule(PieceFieldError? Function(String input) rule) =>
    Validators.delegate((control) {
      final error = rule(control.value as String? ?? '');
      return error == null ? null : {error.name: true};
    });
