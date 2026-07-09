import 'package:ensayo/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class SessionScreen extends StatelessWidget {
  const SessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Scaffold(appBar: AppBar(title: Text(t.session.title)));
  }
}
