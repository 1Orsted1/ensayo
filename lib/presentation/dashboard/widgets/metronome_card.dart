import 'package:ensayo/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class MetronomeCard extends StatefulWidget {
  const MetronomeCard({super.key});

  @override
  State<MetronomeCard> createState() => _MetronomeCardState();
}

class _MetronomeCardState extends State<MetronomeCard> {
  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  t.metronome.title,
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
                Text(t.metronome.bpm(count: 115)),
              ],
            ),
            Slider(value: .5, onChanged: (_) => print("TODO")),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Chip(label: Text("-5")),
                Chip(label: Text("-1")),
                Chip(label: Text("+1")),
                Chip(label: Text("+5")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
