import 'dart:async';

import 'package:ensayo/application/no-brainer/playground_bloc.dart';
import 'package:ensayo/injection.dart';
import 'package:ensayo/presentation/theme/extensions/app_theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class Playground extends StatelessWidget {
  const Playground({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PlaygroundBloc>(),
      child: const _PlaygroundView(),
    );
  }
}

class _PlaygroundView extends StatelessWidget {
  const _PlaygroundView();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PlaygroundBloc>();
    final myColors = context.colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text("To suck less every day!!")),
      body: BlocBuilder<PlaygroundBloc, PlaygroundState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(24),

                _SonarPulse(
                  stream: bloc.onPulse,
                  color: myColors.primary,
                  child: SizedBox.shrink(),
                ),

                Gap(32),
                Text('soLoud'),
                ElevatedButton(
                  onPressed: () => bloc.add(const PlaygroundEvent.realDeal()),
                  child: Text("Start soLoud"),
                ),
                Gap(12),
                Slider(
                  min: 1,
                  max: 6,
                  value: state.intervalSeconds.toDouble(),
                  onChanged: (value) {
                    bloc.add(PlaygroundEvent.intervalChanged(value.toInt()));
                  },
                ),
                Gap(40),
                ElevatedButton(
                  onPressed: () => bloc.add(const PlaygroundEvent.stopped()),
                  child: Text("Stop"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Expanding, fading rings triggered by [stream], sonar-style, centered on
// [child]. Each pulse spawns its own short-lived AnimationController so
// overlapping pulses (fast tempos) can animate independently.
class _SonarPulse extends StatefulWidget {
  const _SonarPulse({
    required this.stream,
    required this.color,
    required this.child,
  });

  final Stream<void> stream;
  final Color color;
  final Widget child;

  @override
  State<_SonarPulse> createState() => _SonarPulseState();
}

class _SonarPulseState extends State<_SonarPulse>
    with TickerProviderStateMixin {
  static const _rippleDuration = Duration(milliseconds: 1000);

  final List<AnimationController> _ripples = [];
  StreamSubscription<void>? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = widget.stream.listen((_) => _addRipple());
  }

  void _addRipple() {
    final controller = AnimationController(
      vsync: this,
      duration: _rippleDuration,
    );
    _ripples.add(controller);
    controller.forward().whenCompleteOrCancel(() {
      _ripples.remove(controller);
      controller.dispose();
      if (mounted) setState(() {});
    });
    setState(() {});
  }

  @override
  void dispose() {
    _subscription?.cancel();
    for (final controller in _ripples) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(
        alignment: Alignment.center,
        children: [
          for (final controller in _ripples)
            AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                final t = Curves.easeOut.transform(controller.value);
                return Opacity(
                  opacity: (1 - t).clamp(0.0, 1.0),
                  child: Container(
                    width: 40 + t * 80,
                    height: 40 + t * 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: widget.color, width: 2),
                    ),
                  ),
                );
              },
            ),
          widget.child,
        ],
      ),
    );
  }
}
