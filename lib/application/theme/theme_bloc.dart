import 'package:bloc/bloc.dart';

import 'package:ensayo/domain/theme/i_theme_facade.dart';
import 'package:ensayo/domain/theme/selected_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'theme_event.dart';
part 'theme_state.dart';
part 'theme_bloc.freezed.dart';

@injectable
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  static const _defaultTheme = SelectedTheme.light;
  ThemeBloc(IThemeFacade facade) : super(ThemeState.initial()) {
    on<_GetTheme>((event, emit) async {
      try {
        final SelectedTheme? theme = await facade.getThemeName();
        if (theme != null) {
          emit(state.copyWith(selectedTheme: theme));
        } else {
          final setThemeOk = await facade.setTheme(_defaultTheme);
          if (!setThemeOk) {
            print('Error setting defaultTheme: $_defaultTheme');
          }
          emit(state.copyWith(selectedTheme: _defaultTheme));
        }
      } catch (e) {
        if (kDebugMode) print("Error loading the theme $e");
        throw Exception('Error loading the theme: $e');
      }
    });

    on<_SetTheme>((event, emit) async {
      try {
        final setThemeOk = await facade.setTheme(event.selectedTheme);
        if (!setThemeOk) {
          print('Error setting defaultTheme: ${event.selectedTheme}');
        }
        emit(state.copyWith(selectedTheme: event.selectedTheme));
      } catch (e) {
        if (kDebugMode) print("Error setting the theme $e");
        throw Exception('Error setting the theme: $e');
      }
    });
  }
}
