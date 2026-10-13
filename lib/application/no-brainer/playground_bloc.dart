import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ensayo/domain/no-brainer/i_playground_facade.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'playground_event.dart';
part 'playground_state.dart';
part 'playground_bloc.freezed.dart';

@singleton
class PlaygroundBloc extends Bloc<PlaygroundEvent, PlaygroundState> {
  PlaygroundBloc(this._facade) : super(const PlaygroundState()) {
    on<LoopImplementationStarted>(_onLoopImplementationStarted);
    on<TimerImplementationStarted>(_onTimerImplementationStarted);
    on<SoLoudImplementationStarted>(_onSoLoudImplementationStarted);
    on<IntervalChanged>(_onIntervalChanged);
    on<Stopped>(_onStopped);
    on<RealDeal>(_onRealDeal);
  }

  final IPlaygroundFacade _facade;

  late Stopwatch stopwatch;
  int beatsCount = 0;
  Timer? _timer;
  bool _isLoopRunning = false;
  final SoLoud _soLoud = SoLoud.instance;

  final _pulseController = StreamController<void>.broadcast();

  // Fires every time a click is actually played, so the UI can pulse in sync.
  Stream<void> get onPulse => _pulseController.stream;

  // "dead simple v1": a naive Future.doWhile loop, ticking once a second.
  Future<void> _onLoopImplementationStarted(
    LoopImplementationStarted event,
    Emitter<PlaygroundState> emit,
  ) async {
    _reset();
    _isLoopRunning = true;
    emit(state.copyWith(activeImplementation: PlaygroundImplementation.loop));

    await Future.doWhile(() async {
      if (!_isLoopRunning) return false;
      await Future.delayed(const Duration(seconds: 1));
      if (!_isLoopRunning) return false;
      _pulseController.add(null);
      await _facade.playClick();
      return _isLoopRunning;
    });
  }

  // "dead simple v2": Timer.periodic driven by the interval slider.
  void _onTimerImplementationStarted(
    TimerImplementationStarted event,
    Emitter<PlaygroundState> emit,
  ) {
    _startTimer(1);
    emit(state.copyWith(activeImplementation: PlaygroundImplementation.timer));
  }

  void _onSoLoudImplementationStarted(
    SoLoudImplementationStarted event,
    Emitter<PlaygroundState> emit,
  ) async {
    await _soLoud.init();
    emit(state.copyWith(activeImplementation: PlaygroundImplementation.soLoud));
    await _soLoud.loadUrl(
      'https://codeskulptor-demos.commondatastorage.googleapis.com/pang/pop.mp3',
      mode: LoadMode.memory,
    );
  }

  void _onRealDeal(RealDeal event, Emitter<PlaygroundState> emit) async {
    beatsCount = 0;
    await _soLoud.init();
    final sound = await _soLoud.loadUrl(
      'https://codeskulptor-demos.commondatastorage.googleapis.com/pang/pop.mp3',
      mode: LoadMode.memory,
    );
    _pulseController.add(null);
    emit(state.copyWith(audioSource: sound));
    stopwatch = Stopwatch()..start();
    _timer = Timer.periodic(Duration(milliseconds: 15), _tickTock);
  }

  void _tickTock(Timer timer) async {
    final xtimeNumber = ((1000 / state.intervalSeconds) * beatsCount);
    final xtime = Duration(milliseconds: xtimeNumber.round());
    if (stopwatch.elapsed >= xtime) {
      // dev.log(
      //   "time: ${stopwatch.elapsed}\nbeats: $beatsCount\nbeatsxsec: ${state.intervalSeconds}",
      // );
      _pulseController.add(null);
      beatsCount += 1;
    }
  }

  void _onIntervalChanged(
    IntervalChanged event,
    Emitter<PlaygroundState> emit,
  ) {
    stopwatch.reset();
    beatsCount = 0;
    emit(
      state.copyWith(
        intervalSeconds: event.intervalSeconds,
        activeImplementation: PlaygroundImplementation.realDeal,
      ),
    );
  }

  void _onStopped(Stopped event, Emitter<PlaygroundState> emit) {
    _reset();
    emit(state.copyWith(activeImplementation: PlaygroundImplementation.none));
  }

  void _startTimer(int intervalSeconds) {
    _timer?.cancel();
    _timer = Timer.periodic(
      Duration(milliseconds: (6000 / intervalSeconds).round()),
      (timer) {
        _pulseController.add(null);
        _facade.playClick();
      },
    );
  }

  void _reset() {
    _isLoopRunning = false;
    _timer?.cancel();
    _timer = null;
    _soLoud.deinit();
    stopwatch.reset();
  }

  @override
  Future<void> close() {
    _reset();
    _soLoud.deinit();
    _pulseController.close();
    stopwatch.stop();
    return super.close();
  }
}
