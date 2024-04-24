import 'package:flutter/material.dart';
import 'package:ui_challenge_2/theme.dart';
import 'package:ui_challenge_2/ui_challenge_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FlutterTodosTheme.light,
      home: const UiChallenge2(),
    );
  }
}
