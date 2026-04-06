import 'package:ensayo/app.dart';
import 'package:ensayo/injection.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const App());
}
