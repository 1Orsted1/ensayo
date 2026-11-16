import 'package:ensayo/domain/plan/focus_tag.dart';
import 'package:ensayo/i18n/strings.g.dart';
import 'package:ensayo/presentation/plan/plan_labels.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FocusTagsField extends StatelessWidget {
  const FocusTagsField({super.key, required this.formControlName});
  final String formControlName;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return ReactiveFormField<Set<FocusTag>, Set<FocusTag>>(
      formControlName: formControlName,
      builder: (field) {
        final selected = field.value ?? const <FocusTag>{};
        return Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final tag in FocusTag.values)
              FilterChip(
                label: Text(focusTagLabel(t, tag)),
                selected: selected.contains(tag),
                onSelected: field.control.enabled
                    ? (isOn) => field.didChange(
                        isOn
                            ? {...selected, tag}
                            : ({...selected}..remove(tag)),
                      )
                    : null,
              ),
          ],
        );
      },
    );
  }
}
