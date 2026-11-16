import 'package:bloc/bloc.dart';

/// Lets tests assert that failures are reported (D9), not swallowed.
class RecordingBlocObserver extends BlocObserver {
  final errors = <Object>[];

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    errors.add(error);
    super.onError(bloc, error, stackTrace);
  }

  static RecordingBlocObserver install(
    void Function(void Function()) addTearDown,
  ) {
    final previous = Bloc.observer;
    final recorder = RecordingBlocObserver();
    Bloc.observer = recorder;
    addTearDown(() => Bloc.observer = previous);
    return recorder;
  }
}
