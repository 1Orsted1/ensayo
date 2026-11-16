import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/plan/plan_labels.dart';
import 'package:ensayo/presentation/plan/widgets/status_pill.dart';
import 'package:ensayo/presentation/theme/extensions/app_theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PieceCard extends StatelessWidget {
  const PieceCard({super.key, required this.piece, required this.onTap});
  final Piece piece;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final text = context.textStyle;
    final color = context.colorScheme;
    final composer = piece.composer;
    final bpm = piece.targetBpm;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(piece.title, style: text.titleMedium),
                        if (composer != null)
                          Text(
                            composer,
                            style: text.bodyMedium?.copyWith(
                              color: color.onSurfaceVariant,
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (bpm != null) ...[
                    const Gap(12),
                    Text('$bpm', style: text.headlineMedium),
                    const Gap(4),
                    Text(t.plan.bpmUnit, style: text.labelSmall),
                  ],
                ],
              ),
              const Gap(12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  StatusPill(label: statusLabel(t, piece.status)),
                  for (final tag in piece.tags)
                    Text(
                      focusTagLabel(t, tag),
                      style: text.bodySmall?.copyWith(
                        color: color.onSurfaceVariant,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
