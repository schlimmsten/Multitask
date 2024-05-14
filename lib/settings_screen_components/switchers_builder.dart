import 'package:flutter/material.dart';
import 'package:multitask/settings_screen_components/switcher_class.dart';
import 'package:provider/provider.dart';
import 'package:multitask/themes/custom_theme.dart';

class SwitchersBuilder extends StatelessWidget {
  const SwitchersBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    final customTheme = Provider.of<CustomTheme>(context);
    return Column(
      children: [
        SettingsRow(
            title: "Разрешить уведомления",
            initialValue: false,
            onChanged: (value) {},
            width: 40),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        SettingsRow(
            title: "Показывать расписание",
            initialValue: false,
            onChanged: (value) {},
            width: 45),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        SettingsRow(
            title: "Тёмная тема",
            initialValue: customTheme.isDarkTheme,
            onChanged: (value) {
              customTheme.toggleTheme(
                  value); // Используем метод экземпляра класса CustomTheme, предоставленного провайдером
            },
            width: 160),
        SizedBox(height: MediaQuery.of(context).size.height * 0.4),
      ],
    );
  }
}
