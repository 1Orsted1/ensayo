import 'package:ensayo/application/metrics/metrics_cubit.dart';
import 'package:ensayo/domain/metrics/daily_goal.dart';
import 'package:ensayo/domain/metrics/goal_save_status.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/theme/extensions/app_theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DailyGoalForm extends StatefulWidget {
  const DailyGoalForm({super.key});

  static Future<void> show(BuildContext context) {
    final cubit = context.read<MetricsCubit>();
    return showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      builder: (_) =>
          BlocProvider.value(value: cubit, child: const DailyGoalForm()),
    );
  }

  @override
  State<DailyGoalForm> createState() => _DailyGoalFormState();
}

class _DailyGoalFormState extends State<DailyGoalForm> {
  late final FormControl<int> _goalControl;
  late final FormGroup _form;
  var _saving = false;
  var _saveFailed = false;

  @override
  void initState() {
    super.initState();
    _goalControl = FormControl<int>(
      value: context.read<MetricsCubit>().state.goalMinutes,
    );
    _form = FormGroup({'goal': _goalControl});
  }

  @override
  void dispose() {
    _form.dispose();
    super.dispose();
  }

  void _changeBy(int amount) {
    final value = _goalControl.value ?? defaultGoal;
    setState(() {
      _goalControl.value = clampGoal(value + amount);
      _saveFailed = false;
    });
  }

  Future<void> _save() async {
    if (_saving) return;
    setState(() {
      _saving = true;
      _saveFailed = false;
    });
    final cubit = context.read<MetricsCubit>();
    await cubit.setDailyGoal(_goalControl.value ?? defaultGoal);
    if (!mounted) return;

    if (cubit.state.goalSaveStatus == GoalSaveStatus.idle) {
      Navigator.of(context).pop();
      return;
    }
    setState(() {
      _saving = false;
      _saveFailed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final value = _goalControl.value ?? defaultGoal;
    return ReactiveForm(
      formGroup: _form,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          24,
          24,
          24,
          24 + MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(t.dailyGoal.editorTitle, style: context.textStyle.titleLarge),
            const Gap(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  key: const ValueKey('daily-goal-decrease'),
                  onPressed: _saving ? null : () => _changeBy(-goalStep),
                  icon: const Icon(Icons.remove),
                ),
                Text(
                  '$value ${t.dailyGoal.minutesUnit}',
                  style: context.textStyle.headlineMedium,
                ),
                IconButton(
                  key: const ValueKey('daily-goal-increase'),
                  onPressed: _saving ? null : () => _changeBy(goalStep),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            const Gap(24),
            FilledButton(
              key: const ValueKey('daily-goal-save'),
              onPressed: _saving ? null : _save,
              child: Text(t.dailyGoal.save),
            ),
            if (_saveFailed) ...[
              const Gap(12),
              Text(
                t.dailyGoal.saveFailure,
                textAlign: TextAlign.center,
                style: context.textStyle.bodyMedium?.copyWith(
                  color: context.colorScheme.error,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
