import 'package:ensayo/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Scaffold(appBar: AppBar(title: Text(t.progress.title)));
  }
}
