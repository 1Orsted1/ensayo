part of 'playground_bloc.dart';

enum PlaygroundImplementation { none, loop, timer, soLoud, realDeal }

@freezed
abstract class PlaygroundState with _$PlaygroundState {
  const factory PlaygroundState({
    @Default(PlaygroundImplementation.none)
    PlaygroundImplementation activeImplementation,
    @Default(1) int intervalSeconds,
    AudioSource? audioSource,
  }) = _PlaygroundState;
}
