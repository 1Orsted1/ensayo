import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/theme/extensions/app_theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PlanEmptyState extends StatelessWidget {
  const PlanEmptyState({super.key, required this.onAdd});
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
