import 'package:drift/drift.dart';
import 'package:ensayo/domain/theme/selected_theme.dart';

class ThemeData extends Table {
  TextColumn get currentTheme => textEnum<SelectedTheme>()();
}
