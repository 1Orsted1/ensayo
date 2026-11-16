import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/theme/extensions/app_theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PlanHero extends StatelessWidget {
  const PlanHero({super.key});

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
