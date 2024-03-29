import 'package:flutter/material.dart';
import 'package:multitask/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:multitask/themes/custom_theme.dart';



class MultitaskApp extends StatelessWidget {
  const MultitaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomTheme>(
      builder: (context, customTheme, child) {
        return MaterialApp(
          title: "Приветствуем",
          home: const SplashScreen(),
          theme: customTheme.currentTheme,
        );
      },
    );
  }
}
