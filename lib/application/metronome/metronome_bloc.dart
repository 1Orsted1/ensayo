import 'package:bloc/bloc.dart';
import 'package:ensayo/domain/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'metronome_event.dart';
part 'metronome_state.dart';
part 'metronome_bloc.freezed.dart';

@lazySingleton
class MetronomeBloc extends Bloc<MetronomeEvent, MetronomeState> {
  MetronomeBloc() : super(MetronomeState.initial()) {
    on<_Initialize>(_initialize);
    on<_Start>(_start);
    on<_SetBpm>(_setBpm);
    on<_Stop>(_stop);
  }
  void _initialize(MetronomeEvent event, Emitter<MetronomeState> emit) async {
    emit(state.copyWith(beatCount: 0, bpm: twoBeatsPerSecondValue));
  }

  void _start(MetronomeEvent event, Emitter<MetronomeState> emit) async {}
  void _setBpm(MetronomeEvent event, Emitter<MetronomeState> emit) async {}
  void _stop(MetronomeEvent event, Emitter<MetronomeState> emit) async {}

  @postConstruct
  void init() {
    _Initialize();
  }
}
