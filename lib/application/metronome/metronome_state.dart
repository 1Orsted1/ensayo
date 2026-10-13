part of 'metronome_bloc.dart';

@freezed
abstract class MetronomeState with _$MetronomeState {
  const factory MetronomeState({required int beatCount, required int bpm}) =
      _MetronomeState;

  factory MetronomeState.initial() =>
      MetronomeState(beatCount: 0, bpm: twoBeatsPerSecondValue);
}
