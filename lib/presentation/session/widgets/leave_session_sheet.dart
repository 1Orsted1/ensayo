import 'package:ensayo/i18n/strings.g.dart';
import 'package:flutter/material.dart';

enum LeaveSessionAction { finish, discard }

class LeaveSessionSheet extends StatelessWidget {
  const LeaveSessionSheet({super.key});

  static Future<LeaveSessionAction?> show(BuildContext context) {
    return showModalBottomSheet<LeaveSessionAction>(
      context: context,
      useSafeArea: true,
      builder: (_) => const LeaveSessionSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            t.session.leave.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(t.session.leave.body),
          const SizedBox(height: 24),
          FilledButton(
            key: const ValueKey('leave-finish-button'),
            onPressed: () =>
                Navigator.of(context).pop(LeaveSessionAction.finish),
            child: Text(t.session.finishSession),
          ),
          TextButton(
            key: const ValueKey('leave-discard-button'),
            onPressed: () =>
                Navigator.of(context).pop(LeaveSessionAction.discard),
            child: Text(t.session.leave.discard),
          ),
          TextButton(
            key: const ValueKey('keep-practicing-button'),
            onPressed: () => Navigator.of(context).pop(),
            child: Text(t.session.leave.keepPracticing),
          ),
        ],
      ),
    );
  }
}
