part of 'playground_bloc.dart';

@freezed
abstract class PlaygroundEvent with _$PlaygroundEvent {
  // "dead simple v1" implementation.
  const factory PlaygroundEvent.loopImplementationStarted() =
      LoopImplementationStarted;

  // "dead simple v2" implementation.
  const factory PlaygroundEvent.timerImplementationStarted() =
      TimerImplementationStarted;

  const factory PlaygroundEvent.soLoudImplementationStarted() =
      SoLoudImplementationStarted;

  const factory PlaygroundEvent.intervalChanged(int intervalSeconds) =
      IntervalChanged;

  const factory PlaygroundEvent.stopped() = Stopped;

  const factory PlaygroundEvent.realDeal() = RealDeal;
}
