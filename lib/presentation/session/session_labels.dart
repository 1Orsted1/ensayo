import 'package:ensayo/domain/plan/piece_validation.dart';
import 'package:ensayo/domain/session/piece_log_validation.dart';
import 'package:ensayo/domain/session/piece_mood.dart';
import 'package:ensayo/domain/session/session_failure.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

IconData sessionMoodIcon(PieceMood mood) => switch (mood) {
  PieceMood.tough => Icons.sentiment_very_dissatisfied,
  PieceMood.okay => Icons.sentiment_neutral,
  PieceMood.calm => Icons.sentiment_satisfied,
  PieceMood.inspired => Icons.auto_awesome,
  PieceMood.proud => Icons.star,
};

String sessionMoodLabel(Translations t, PieceMood mood) => switch (mood) {
  PieceMood.tough => t.session.mood.tough,
  PieceMood.okay => t.session.mood.okay,
  PieceMood.calm => t.session.mood.calm,
  PieceMood.inspired => t.session.mood.inspired,
  PieceMood.proud => t.session.mood.proud,
};

Map<String, ValidationMessageFunction> pieceLogValidationMessages(
  Translations t,
) => {
  PieceLogFieldError.durationOutOfRange.name: (_) => t.session.validation
      .durationOutOfRange(min: minPieceMinutes, max: maxPieceMinutes),
  PieceLogFieldError.noteTooLong.name: (_) =>
      t.session.validation.noteTooLong(max: maxPieceNoteLength),
  PieceFieldError.bpmOutOfRange.name: (_) => t.session.validation
      .tempoOutOfRange(min: minTargetBpm, max: maxTargetBpm),
};

String sessionFailureMessage(Translations t, SessionFailure failure) =>
    switch (failure) {
      SessionFailure.restore => t.session.failure.restore,
      SessionFailure.start => t.session.failure.start,
      SessionFailure.log => t.session.failure.log,
      SessionFailure.finish => t.session.failure.finish,
      SessionFailure.discard => t.session.failure.discard,
    };
