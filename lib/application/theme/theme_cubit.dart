import 'package:ensayo/domain/theme/selected_theme.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ThemeCubit extends HydratedCubit<SelectedTheme> {
  ThemeCubit() : super(SelectedTheme.light);

  void setTheme(SelectedTheme newTheme) => emit(newTheme);
  
  @override
  SelectedTheme? fromJson(Map<String, dynamic> json) => json['selectedTheme'] != null
      ? SelectedTheme.values[json['selectedTheme']]
      : null;
  
  @override
  Map<String, dynamic>? toJson(SelectedTheme state) => { 'selectedTheme': state.name };
}