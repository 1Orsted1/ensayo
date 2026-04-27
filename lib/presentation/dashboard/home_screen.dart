import 'package:ensayo/application/theme/theme_cubit.dart';
import 'package:ensayo/domain/theme/selected_theme.dart';
import 'package:ensayo/presentation/dashboard/widgets/quick_start_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ThemeCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
        actions: [
          IconButton(
            onPressed: () {
              bloc.setTheme(
                bloc.isDarkTheme ? SelectedTheme.light : SelectedTheme.dark,
              );
            },
            icon: Icon(
              bloc.isDarkTheme ? Icons.sunny : Icons.nightlight_outlined,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            QuickStartCard(
              title: 'Ready to play',
              subtitle: 'Your focus today: technical proficiency',
              onStart: () {},
            ),
          ],
        ),
      ),
    );
  }
}
