import 'package:ensayo/domain/session/piece_log_validation.dart';
import 'package:ensayo/domain/session/session_rules.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/session/widgets/elapsed_builder.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DurationSliderField extends StatelessWidget {
  const DurationSliderField({
    required this.formControlName,
    required this.currentSince,
    super.key,
  });

  final String formControlName;
  final DateTime currentSince;

  @override
  Widget build(BuildContext context) {
    return ReactiveValueListenableBuilder<int>(
      formControlName: formControlName,
      builder: (context, control, child) {
        if (control.pristine) {
          return ElapsedBuilder(
            since: currentSince,
            builder: (context, elapsed) =>
                _slider(context, control, suggestedPieceMinutes(elapsed)),
          );
        }
        return _slider(context, control, control.value ?? minPieceMinutes);
      },
    );
  }

  Widget _slider(
    BuildContext context,
    AbstractControl<int> control,
    int minutes,
  ) {
    return Column(
      children: [
        Text(
          '$minutes ${context.t.session.minutesUnit}',
          key: const ValueKey('duration-value'),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Slider(
          key: const ValueKey('duration-slider'),
          value: minutes.toDouble(),
          min: minPieceMinutes.toDouble(),
          max: maxPieceMinutes.toDouble(),
          divisions: maxPieceMinutes - minPieceMinutes,
          onChanged: (value) => control.value = value.round(),
        ),
      ],
    );
  }
}
