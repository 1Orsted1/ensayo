import 'package:ensayo/domain/session/session_summary.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/theme/extensions/app_theme_extensions.dart';
import 'package:flutter/material.dart';

class SessionLogTile extends StatelessWidget {
  const SessionLogTile({required this.summary, super.key});

  final SessionSummary summary;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final localizations = MaterialLocalizations.of(context);
    final startedAt = summary.startedAt.toLocal();
    final date = localizations.formatMediumDate(startedAt);
    final time = localizations.formatTimeOfDay(
      TimeOfDay.fromDateTime(startedAt),
    );
    final minutes = summary.duration.inMinutes;

    return Card(
      key: ValueKey('session-log-${summary.id}'),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(date, style: context.textStyle.titleMedium),
                  Text(time, style: context.textStyle.bodySmall),
                  const SizedBox(height: 8),
                  Text(
                    t.logs.pieceCount(
                      n: summary.pieceCount,
                      count: summary.pieceCount,
                    ),
                    style: context.textStyle.bodyMedium,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('$minutes', style: context.textStyle.headlineMedium),
                Text(t.logs.minutes, style: context.textStyle.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
