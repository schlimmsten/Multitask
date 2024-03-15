import 'package:flutter/material.dart';
import 'package:multitask/screens/splash_screen.dart';

class MultitaskApp extends StatelessWidget {
  const MultitaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Приветствуем",
      home: SplashScreen(),
    );
  }
}