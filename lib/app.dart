import 'package:ensayo/application/theme/theme_cubit.dart';
import 'package:ensayo/domain/theme/selected_theme.dart';
import 'package:ensayo/presentation/core/app_router.dart';
import 'package:ensayo/injection.dart';
import 'package:ensayo/domain/theme/i_personalized_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => getIt<ThemeCubit>())],
      child: BlocBuilder<ThemeCubit, SelectedTheme>(
        builder: (context, selectedTheme) {
          return MaterialApp.router(
            title: 'Flutter Widgets Demo',
            theme: getIt<IPersonalizedTheme>(
              instanceName: selectedTheme.value,
            ).getTheme(),
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
