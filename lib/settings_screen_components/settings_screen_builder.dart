import 'package:flutter/material.dart';
import 'package:multitask/settings_screen_components/line.dart';
import 'package:multitask/settings_screen_components/switchers_builder.dart';
import 'back_button.dart';

class SettingsScreenBuilder extends StatelessWidget {
  const SettingsScreenBuilder({super.key});

//BackButtonMenu сделать ниже
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Line(),
          const SizedBox(height: 40),
          const SwitchersBuilder(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          const Line(),
          const BackButtonMenu(),
        ],
      )
    );
  }
}