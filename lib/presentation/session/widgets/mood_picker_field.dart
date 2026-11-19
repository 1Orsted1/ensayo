import 'package:ensayo/domain/session/piece_mood.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/session/session_labels.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class MoodPickerField extends StatelessWidget {
  const MoodPickerField({required this.formControlName, super.key});

  final String formControlName;

  @override
  Widget build(BuildContext context) {
    return ReactiveValueListenableBuilder<PieceMood?>(
      formControlName: formControlName,
      builder: (context, control, child) {
        return Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final mood in PieceMood.values)
              ChoiceChip(
                key: ValueKey('mood-${mood.name}'),
                selected: control.value == mood,
                avatar: Icon(sessionMoodIcon(mood)),
                label: Text(sessionMoodLabel(context.t, mood)),
                onSelected: (selected) =>
                    control.value = selected ? mood : null,
              ),
          ],
        );
      },
    );
  }
}
