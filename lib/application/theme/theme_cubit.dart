import 'package:ensayo/domain/theme/selected_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ThemeCubit extends HydratedCubit<SelectedTheme> {
  ThemeCubit() : super(SelectedTheme.light);

  void setTheme(SelectedTheme newTheme) => emit(newTheme);

  @override
  SelectedTheme? fromJson(Map<String, dynamic> json) {
    try {
      return json['selectedTheme'] != null
          ? SelectedTheme.values.byName(json['selectedTheme'])
          : null;
    } catch (e) {
      //Todo: implementation error crashlytics
      if (kDebugMode) {
        print("Error: $e");
      }
      return null;
    }
  }

  bool get isLightTheme => state.value == SelectedTheme.light.value;
  bool get isDarkTheme => state.value == SelectedTheme.dark.value;

  @override
  Map<String, dynamic>? toJson(SelectedTheme state) => {
    'selectedTheme': state.name,
  };
}
