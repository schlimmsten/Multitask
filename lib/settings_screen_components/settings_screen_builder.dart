import 'package:flutter/material.dart';
import 'package:multitask/settings_screen_components/line.dart';
import 'package:multitask/settings_screen_components/switchers_builder.dart';
import 'back_button.dart';

class SettingsScreenBuilder extends StatelessWidget {
  const SettingsScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Line(),
          SizedBox(height: 40),
          SwitchersBuilder(),
          Line(),
          BackButtonMenu(),
        ],
      )
    );
  }
}