import 'package:ensayo/application/session/session_bloc.dart';
import 'package:ensayo/domain/session/session_action_status.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinishSessionButton extends StatelessWidget {
  const FinishSessionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionBloc, SessionState>(
      buildWhen: (previous, current) =>
          previous.actionStatus != current.actionStatus,
      builder: (context, state) {
        return FilledButton(
          key: const ValueKey('finish-session-button'),
          onPressed: state.actionStatus == SessionActionStatus.inProgress
              ? null
              : () => context.read<SessionBloc>().add(
                  const SessionEvent.finishRequested(),
                ),
          child: Text(context.t.session.finishSession),
        );
      },
    );
  }
}
