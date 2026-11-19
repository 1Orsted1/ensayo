import 'package:ensayo/application/logs/logs_bloc.dart';
import 'package:ensayo/domain/logs/logs_load_status.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/logs/widgets/session_log_tile.dart';
import 'package:ensayo/presentation/plan/widgets/load_failure_view.dart';
import 'package:ensayo/presentation/plan/widgets/muted_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogsScreen extends StatelessWidget {
  const LogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return Scaffold(
      appBar: AppBar(title: Text(t.logs.title)),
      body: BlocBuilder<LogsBloc, LogsState>(
        builder: (context, state) {
          switch (state.loadStatus) {
            case LogsLoadStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case LogsLoadStatus.failure:
              return LoadFailureView(
                message: t.logs.loadFailure,
                retryLabel: t.logs.retry,
                onRetry: () =>
                    context.read<LogsBloc>().add(const LogsEvent.started()),
              );
            case LogsLoadStatus.loaded:
              if (state.sessions.isEmpty) {
                return Center(child: MutedMessage(t.logs.empty));
              }
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: state.sessions.length,
                separatorBuilder: (_, _) => const SizedBox(height: 8),
                itemBuilder: (context, index) =>
                    SessionLogTile(summary: state.sessions[index]),
              );
          }
        },
      ),
    );
  }
}
