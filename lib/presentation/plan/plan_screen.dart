import 'package:ensayo/application/plan/plan_bloc.dart';
import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/domain/plan/plan_load_status.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/plan/widgets/load_failure_view.dart';
import 'package:ensayo/presentation/plan/widgets/muted_message.dart';
import 'package:ensayo/presentation/plan/widgets/piece_card.dart';
import 'package:ensayo/presentation/plan/widgets/plan_empty_state.dart';
import 'package:ensayo/presentation/plan/widgets/plan_filter_chips.dart';
import 'package:ensayo/presentation/plan/widgets/plan_hero.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  void _addPiece(BuildContext context) => context.push('/plan/new');

  void _editPiece(BuildContext context, Piece piece) =>
      context.push('/plan/${piece.id}');

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Scaffold(
      appBar: AppBar(title: Text(t.plan.title)),
      floatingActionButton: FloatingActionButton(
        tooltip: t.plan.form.addTitle,
        onPressed: () => _addPiece(context),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<PlanBloc, PlanState>(
        builder: (context, state) {
          if (state.loadStatus == PlanLoadStatus.failure) {
            return LoadFailureView(
              message: t.plan.failure.load,
              retryLabel: t.plan.failure.retry,
              onRetry: () =>
                  context.read<PlanBloc>().add(const PlanEvent.started()),
            );
          }
          if (state.loadStatus == PlanLoadStatus.loading &&
              state.pieces.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          final visible = state.visiblePieces;
          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 96),
            children: [
              const PlanHero(),
              const Gap(16),
              PlanFilterChips(selected: state.filter),
              const Gap(16),
              if (state.pieces.isEmpty)
                PlanEmptyState(onAdd: () => _addPiece(context))
              else if (visible.isEmpty)
                MutedMessage(t.plan.empty.noMatches)
              else
                for (final piece in visible)
                  PieceCard(
                    piece: piece,
                    onTap: () => _editPiece(context, piece),
                  ),
            ],
          );
        },
      ),
    );
  }
}
