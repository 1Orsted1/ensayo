import 'package:ensayo/application/theme/theme_bloc.dart';
import 'package:ensayo/presentation/demo_screen.dart';
import 'package:ensayo/injection.dart';
import 'package:ensayo/presentation/theme/i_personalized_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData getThemeData(String name) {
      return getIt<IPersonalizedTheme>(instanceName: name).getTheme();
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ThemeBloc>()..add(ThemeEvent.getTheme()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        buildWhen: (p, c) => p.selectedTheme != c.selectedTheme,
        builder: (context, state) {
          final themeData = getThemeData(state.selectedTheme.name);
          return MaterialApp(
            title: 'Flutter Widgets Demo',
            theme: themeData,
            home: const DemoScreen(),
          );
        },
      ),
    );
  }
}
