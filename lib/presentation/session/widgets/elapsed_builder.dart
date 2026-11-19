import 'package:clock/clock.dart';
import 'package:flutter/material.dart';

class ElapsedBuilder extends StatelessWidget {
  const ElapsedBuilder({required this.since, required this.builder, super.key});

  final DateTime since;
  final Widget Function(BuildContext context, Duration elapsed) builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: Stream<DateTime>.periodic(
        const Duration(seconds: 1),
        (_) => clock.now(),
      ),
      builder: (context, snapshot) {
        final elapsed = clock.now().difference(since);
        return builder(context, elapsed.isNegative ? Duration.zero : elapsed);
      },
    );
  }
}
