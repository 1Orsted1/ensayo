import 'package:ensayo/application/plan/plan_bloc.dart';
import 'package:ensayo/domain/plan/piece.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/plan/plan_labels.dart';
import 'package:ensayo/presentation/theme/extensions/app_theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

/// The Plan tab: the musician's single practice plan.
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
            return _LoadFailure(
              onRetry: () => context.read<PlanBloc>().add(const PlanStarted()),
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
              const _Hero(),
              const Gap(16),
              _FilterChips(selected: state.filter),
              const Gap(16),
              if (state.pieces.isEmpty)
                _EmptyPlan(onAdd: () => _addPiece(context))
              else if (visible.isEmpty)
                _Message(t.plan.empty.noMatches)
              else
                for (final piece in visible)
                  _PieceCard(
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

class _Hero extends StatelessWidget {
  const _Hero();

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(t.plan.hero, style: context.textStyle.headlineLarge),
        const Gap(4),
        Text(
          t.plan.helper,
          style: context.textStyle.bodySmall?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _FilterChips extends StatelessWidget {
  const _FilterChips({required this.selected});
  final PlanFilter selected;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final filter in PlanFilter.values)
          ChoiceChip(
            label: Text(filterLabel(t, filter)),
            selected: filter == selected,
            onSelected: (_) =>
                context.read<PlanBloc>().add(PlanFilterChanged(filter)),
          ),
      ],
    );
  }
}

class _PieceCard extends StatelessWidget {
  const _PieceCard({required this.piece, required this.onTap});
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
                  _StatusPill(label: statusLabel(t, piece.status)),
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

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.secondaryContainer,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Text(
          label.toUpperCase(),
          style: context.textStyle.labelSmall?.copyWith(
            color: color.onSecondaryContainer,
            letterSpacing: 0.6,
          ),
        ),
      ),
    );
  }
}

class _EmptyPlan extends StatelessWidget {
  const _EmptyPlan({required this.onAdd});
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          Text(t.plan.empty.title, style: context.textStyle.titleMedium),
          const Gap(4),
          Text(
            t.plan.empty.body,
            textAlign: TextAlign.center,
            style: context.textStyle.bodyMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap(16),
          FilledButton(onPressed: onAdd, child: Text(t.plan.empty.action)),
        ],
      ),
    );
  }
}

class _Message extends StatelessWidget {
  const _Message(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: context.textStyle.bodyMedium?.copyWith(
          color: context.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

class _LoadFailure extends StatelessWidget {
  const _LoadFailure({required this.onRetry});
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(t.plan.failure.load, style: context.textStyle.bodyLarge),
            const Gap(16),
            FilledButton(onPressed: onRetry, child: Text(t.plan.failure.retry)),
          ],
        ),
      ),
    );
  }
}
