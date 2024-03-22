import 'package:flutter/material.dart';
import 'package:multitask/Themes/config.dart';
import 'package:multitask/Themes/custom_theme.dart';
import 'package:multitask/screens/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:multitask/settings/settings_switcher.dart';
import '../text_style.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customTheme = Provider.of<CustomTheme>(context); // Получаем экземпляр CustomTheme из провайдера

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Настройки",
           style: headerTextStyle(), // Не забудьте восстановить этот стиль, если он у вас определен
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 2.0,
              color: Theme.of(context).primaryColor,
              width: MediaQuery.of(context).size.width * 0.9,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Разрешить уведомления",
                   style: settingsTextStyle(), // Не забудьте восстановить этот стиль, если он у вас определен
                ),
              ),
              const SizedBox(width: 40),
              Switcher(
                initialValue: false,
                onChanged: (value) {},
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Показывать расписание",
                   style: settingsTextStyle(), // Не забудьте восстановить этот стиль, если он у вас определен
                ),
              ),
              const SizedBox(width: 45),
              Switcher(
                initialValue: false,
                onChanged: (value) {},
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Тёмная тема",
                   style: settingsTextStyle(), // Не забудьте восстановить этот стиль, если он у вас определен
                ),
              ),
              const SizedBox(width: 160),
              Switcher(
                initialValue: currentTheme.isDarkTheme,
                onChanged: (value) {
                  customTheme.toggleTheme(value); // Используем метод экземпляра класса CustomTheme, предоставленного провайдером
                },
              ),
            ],
          ),
          const SizedBox(height: 400),
          Center(
            child: Container(
              height: 2.0,
              color: Theme.of(context).primaryColor,
              width: MediaQuery.of(context).size.width * 0.9,
            ),
          ),
          ElevatedButton(onPressed: 
          (){
               Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const MainScreen()));
          }, 
          child: const Text("Back button"))
        ],
      ),
    );
  }
}
