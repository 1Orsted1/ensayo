import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/plan/plan_labels.dart';
import 'package:ensayo/presentation/theme/extensions/app_theme_extensions.dart';
import 'package:flutter/material.dart';

class CurrentPieceHeader extends StatelessWidget {
  const CurrentPieceHeader({
    required this.piece,
    required this.currentIndex,
    required this.total,
    super.key,
  });

  final Piece piece;
  final int currentIndex;
  final int total;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final composer = piece.composer?.trim();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.session.piecePosition(current: currentIndex + 1, total: total),
          style: context.textStyle.labelSmall,
        ),
        const SizedBox(height: 8),
        Text(piece.title, style: context.textStyle.headlineSmall),
        if (composer != null && composer.isNotEmpty)
          Text(composer, style: context.textStyle.bodyMedium),
        if (piece.tags.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              piece.tags.map((tag) => focusTagLabel(t, tag)).join(' · '),
              style: context.textStyle.bodySmall,
            ),
          ),
      ],
    );
  }
}
