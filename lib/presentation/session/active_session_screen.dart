import 'package:ensayo/application/session/session_bloc.dart';
import 'package:ensayo/domain/session/session_status.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/session/piece_log_form.dart';
import 'package:ensayo/presentation/session/session_labels.dart';
import 'package:ensayo/presentation/session/widgets/discard_session_dialog.dart';
import 'package:ensayo/presentation/session/widgets/finish_session_button.dart';
import 'package:ensayo/presentation/session/widgets/free_practice_message.dart';
import 'package:ensayo/presentation/session/widgets/leave_session_sheet.dart';
import 'package:ensayo/presentation/session/widgets/live_pill.dart';
import 'package:ensayo/presentation/session/widgets/queue_done_message.dart';
import 'package:ensayo/presentation/session/widgets/session_goal_row.dart';
import 'package:ensayo/presentation/session/widgets/session_timer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActiveSessionScreen extends StatelessWidget {
  const ActiveSessionScreen({super.key});

  Future<void> _leave(BuildContext context) async {
    final action = await LeaveSessionSheet.show(context);
    if (!context.mounted || action == null) return;
    switch (action) {
      case LeaveSessionAction.finish:
        context.read<SessionBloc>().add(const SessionEvent.finishRequested());
      case LeaveSessionAction.discard:
        final confirmed = await DiscardSessionDialog.show(context);
        if (!context.mounted || !confirmed) return;
        context.read<SessionBloc>().add(const SessionEvent.discardRequested());
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return PopScope<void>(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) _leave(context);
      },
      child: BlocConsumer<SessionBloc, SessionState>(
        listenWhen: (previous, current) =>
            previous.status != current.status ||
            previous.failure != current.failure,
        listener: (context, state) {
          if (state.status == SessionStatus.idle) {
            final navigator = Navigator.of(context);
            if (navigator.canPop()) navigator.pop();
            return;
          }
          final failure = state.failure;
          if (failure != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(sessionFailureMessage(t, failure))),
            );
          }
        },
        builder: (context, state) {
          final session = state.session;
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                key: const ValueKey('close-session-button'),
                onPressed: () => _leave(context),
                icon: const Icon(Icons.close),
                tooltip: t.session.close,
              ),
              title: Text(t.session.inProgress),
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Center(child: LivePill()),
                ),
              ],
            ),
            body: session == null
                ? const SizedBox.shrink()
                : SafeArea(
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        SessionTimerCard(
                          startedAt: session.startedAt,
                          completedCount: session.completedCount,
                        ),
                        const SizedBox(height: 8),
                        SessionGoalRow(startedAt: session.startedAt),
                        const SizedBox(height: 24),
                        if (state.currentPiece != null)
                          const PieceLogForm()
                        else if (state.isQueueDone)
                          const QueueDoneMessage()
                        else
                          const FreePracticeMessage(),
                        const SizedBox(height: 24),
                        const FinishSessionButton(),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
