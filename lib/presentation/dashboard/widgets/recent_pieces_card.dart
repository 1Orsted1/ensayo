import 'package:ensayo/presentation/theme/extensions/app_theme_extensions.dart';
import 'package:flutter/material.dart';

class RecentPiecesCard extends StatelessWidget {
  const RecentPiecesCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.categories,
  });
  final String title;
  final String subTitle;
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    final theme = context.textStyle;
    final color = context.colorScheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.green],
                stops: [
                  0.0,
                  1.0,
                ], // Optional: precise control of color placement
              ),
            ),
            padding: EdgeInsets.all(16.0),
            child: Icon(Icons.music_note),
          ),
          title: Text(title),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(subTitle),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories
                      .map(
                        (chipContent) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Chip(label: Text(chipContent)),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
