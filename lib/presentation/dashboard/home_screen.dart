import 'package:ensayo/application/theme/theme_cubit.dart';
import 'package:ensayo/domain/theme/selected_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ThemeCubit>();
    return Scaffold(
      appBar: AppBar(title: Text("Home page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            bloc.setTheme(
              bloc.state == SelectedTheme.dark
                  ? SelectedTheme.light
                  : SelectedTheme.dark,
            );
          },
          child: Text("Push me"),
        ),
      ),
    );
  }
}
