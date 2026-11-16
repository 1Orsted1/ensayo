import 'package:ensayo/application/plan/plan_bloc.dart';
import 'package:ensayo/domain/plan/plan_filter.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/plan/plan_labels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanFilterChips extends StatelessWidget {
  const PlanFilterChips({super.key, required this.selected});
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
                context.read<PlanBloc>().add(PlanEvent.filterChanged(filter)),
          ),
      ],
    );
  }
}
