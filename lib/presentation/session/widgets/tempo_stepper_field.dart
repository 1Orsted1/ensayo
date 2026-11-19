import 'package:ensayo/domain/plan/piece_validation.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/session/session_labels.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TempoStepperField extends StatelessWidget {
  const TempoStepperField({required this.formControlName, super.key});

  final String formControlName;

  @override
  Widget build(BuildContext context) {
    return ReactiveValueListenableBuilder<String>(
      formControlName: formControlName,
      builder: (context, control, child) {
        void changeBy(int amount) {
          final current = int.tryParse(control.value ?? '') ?? minTargetBpm;
          control.value = (current + amount)
              .clamp(minTargetBpm, maxTargetBpm)
              .toString();
        }

        return Row(
          children: [
            IconButton(
              key: const ValueKey('tempo-decrease'),
              onPressed: () => changeBy(-1),
              icon: const Icon(Icons.remove),
            ),
            Expanded(
              child: ReactiveTextField<String>(
                key: const ValueKey('piece-tempo-input'),
                formControlName: formControlName,
                validationMessages: pieceLogValidationMessages(context.t),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(suffixText: context.t.plan.bpmUnit),
              ),
            ),
            IconButton(
              key: const ValueKey('tempo-increase'),
              onPressed: () => changeBy(1),
              icon: const Icon(Icons.add),
            ),
          ],
        );
      },
    );
  }
}
