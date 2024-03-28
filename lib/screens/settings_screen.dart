import 'package:flutter/material.dart';
//import 'package:multitask/Themes/config.dart';
import 'package:multitask/themes/custom_theme.dart';
import 'package:multitask/screens/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:multitask/settings_screen_components/settings_switcher.dart';
import '../text_style.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customTheme = Provider.of<CustomTheme>(context); // Получаем экземпляр CustomTheme из провайдера

    return Scaffold(
      body: Column(
        children: [
          //верхняя полоса
          Center(
            child: Container(
              height: 2.0,
              color: Theme.of(context).primaryColor,
              width: MediaQuery.of(context).size.width * 0.9,
            ),
          ),
          const SizedBox(height: 40),
          //можно выделить в отдельный класс? 3 раза одно и то же делаем
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
                initialValue: customTheme.isDarkTheme,
                onChanged: (value) {
                  customTheme.toggleTheme(value); // Используем метод экземпляра класса CustomTheme, предоставленного провайдером
                },
              ),
            ],
          ),
          const SizedBox(height: 400),
          //нижняя полоса
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
