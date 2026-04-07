import 'package:ensayo/domain/theme/selected_theme.dart';

abstract class IThemeFacade {
  SelectedTheme? getThemeName();
  Future<bool> setTheme(SelectedTheme selectedTheme);
}
