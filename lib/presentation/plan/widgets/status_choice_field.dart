import 'package:ensayo/domain/plan/piece_status.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/plan/plan_labels.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class StatusChoiceField extends StatelessWidget {
  const StatusChoiceField({super.key, required this.formControlName});
  final String formControlName;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return ReactiveFormField<PieceStatus, PieceStatus>(
      formControlName: formControlName,
      builder: (field) => Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final status in PieceStatus.values)
            ChoiceChip(
              label: Text(statusLabel(t, status)),
              selected: field.value == status,
              onSelected: field.control.enabled
                  ? (_) => field.didChange(status)
                  : null,
            ),
        ],
      ),
    );
  }
}
