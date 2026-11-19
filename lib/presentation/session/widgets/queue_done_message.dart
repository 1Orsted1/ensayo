import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/plan/widgets/muted_message.dart';
import 'package:flutter/material.dart';

class QueueDoneMessage extends StatelessWidget {
  const QueueDoneMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return MutedMessage(context.t.session.queueDone);
  }
}
