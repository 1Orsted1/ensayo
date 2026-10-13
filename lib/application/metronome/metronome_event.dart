part of 'metronome_bloc.dart';

@freezed
class MetronomeEvent with _$MetronomeEvent {
  const factory MetronomeEvent.initialize() = _Initialize;
  const factory MetronomeEvent.start() = _Start;
  const factory MetronomeEvent.setBpm({required int newBpm}) = _SetBpm;
  const factory MetronomeEvent.stop() = _Stop;
}
