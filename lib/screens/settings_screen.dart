import 'package:flutter/material.dart';
import 'package:multitask/settings_screen_components/settings_screen_builder.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsScreenBuilder(key: key);
  }
}