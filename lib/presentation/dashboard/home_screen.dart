import 'package:ensayo/application/theme/theme_cubit.dart';
import 'package:ensayo/domain/theme/selected_theme.dart';
import 'package:ensayo/presentation/dashboard/widgets/quick_start_card.dart';
import 'package:ensayo/presentation/dashboard/widgets/recent_pieces_card.dart';
import 'package:ensayo/presentation/theme/extensions/app_theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //TODO: ADD device preview,
  //TODO: create a custom widget for the other cards
  //TODO: create DB finnally please :v
  //TODO: make work the practice streak widget
  //TODO: make work the daily goal widget
  //TODO add translations
  //TODO: build metronome

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ThemeCubit>();
    final textStyle = context.textStyle;
    final colorScheme = context.colorScheme;

    final List<(String, String)> dummy = [
      ("Cello Suite No. 1", "J.S. Bach"),
      ("Moonlight Sonata", "L. v. Beethoven"),
      ("Zigeunerweisen", "Pablo de Sarasate"),
    ];
    final List<String> dummyCat = ["Learning", "Polishing", "Not mastered"];

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
        child: ListView(
          children: [
            QuickStartCard(
              title: 'Ready to play',
              subtitle: 'Your focus today: technical proficiency',
              onStart: () {},
            ),
            Gap(32),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Practice strak"),
                        Icon(Icons.local_fire_department_rounded),
                      ],
                    ),
                    Text("14 days"),
                    Text("You are in the top 5%"),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Daily goal"), Icon(Icons.track_changes)],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("30", style: TextStyle(fontSize: 32)),
                        Text(" /60 min"),
                      ],
                    ),
                    Gap(12),
                    LinearProgressIndicator(value: .30),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Quick metronome",
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        Text("115 bpm"),
                      ],
                    ),
                    Slider(value: .5, onChanged: (_) => print("TODO")),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Chip(label: Text("-5")),
                        Chip(label: Text("-1")),
                        Chip(label: Text("+1")),
                        Chip(label: Text("+5")),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //TODO: make it nice and to be its own scrollable space
            Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent pieces",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                ),
                Text("View all"),
              ],
            ),
            Column(
              children: dummy
                  .map(
                    (e) => RecentPiecesCard(
                      title: e.$1,
                      subTitle: e.$2,
                      categories: dummyCat,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
