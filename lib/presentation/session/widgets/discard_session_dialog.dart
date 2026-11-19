import 'package:ensayo/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class DiscardSessionDialog extends StatelessWidget {
  const DiscardSessionDialog({super.key});

  static Future<bool> show(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (_) => const DiscardSessionDialog(),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return AlertDialog(
      title: Text(t.session.discardDialog.title),
      content: Text(t.session.discardDialog.body),
      actions: [
        TextButton(
          key: const ValueKey('discard-cancel-button'),
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(t.session.discardDialog.cancel),
        ),
        FilledButton(
          key: const ValueKey('discard-confirm-button'),
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(t.session.discardDialog.confirm),
        ),
      ],
    );
  }
}
