import 'package:ensayo/application/theme/theme_cubit.dart';
import 'package:ensayo/domain/theme/selected_theme.dart';
import 'package:ensayo/presentation/demo_screen.dart';
import 'package:ensayo/injection.dart';
import 'package:ensayo/presentation/theme/i_personalized_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData getThemeData(String name) {
      return GetIt.I<IPersonalizedTheme>(instanceName: name).getTheme();
    }
    return MultiBlocProvider(
      providers: [
        //Manages theme selection and persistence across app restarts using HydratedBloc.
        BlocProvider(
          create: (context) => getIt<ThemeCubit>(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, SelectedTheme>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, selectedTheme) {
          return MaterialApp(
            title: 'Flutter Widgets Demo',
            theme: getThemeData(selectedTheme.name),
            home: const DemoScreen(),
          );
        },
      ),
    );
  }
}
