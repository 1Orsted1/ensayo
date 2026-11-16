import 'package:ensayo/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class DeletePieceDialog extends StatelessWidget {
  const DeletePieceDialog({super.key});

  /// Dismissing the dialog counts as cancelling.
  static Future<bool> show(BuildContext context) async =>
      await showDialog<bool>(
        context: context,
        builder: (_) => const DeletePieceDialog(),
      ) ??
      false;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return AlertDialog(
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
    );
  }
}
