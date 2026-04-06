part of 'theme_bloc.dart';

@freezed
abstract class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.getTheme() = _GetTheme;
  const factory ThemeEvent.setTheme({required SelectedTheme selectedTheme}) =
      _SetTheme;
}
