import 'package:ensayo/domain/theme/constants.dart';
import 'package:ensayo/domain/theme/i_theme_facade.dart';
import 'package:ensayo/domain/theme/selected_theme.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: IThemeFacade)
class ThemeFacadeImpl implements IThemeFacade {
  ThemeFacadeImpl();

  @override
  Future<SelectedTheme?> getThemeName() async {
    String? current = null;
    if (current == null) return SelectedTheme.light;

    SelectedTheme theme = SelectedTheme.values.firstWhere(
      (t) => t.name == current,
      orElse: () => SelectedTheme.light,
    );
    return theme;
  }

  @override
  Future<bool> setTheme(SelectedTheme selectedTheme) async {
    final name = selectedTheme.name;
    final themeName = themes.contains(name) ? name : light;
    return true; //await _sharedPreferences.setString(themeOpt, themeName);
  }
}
