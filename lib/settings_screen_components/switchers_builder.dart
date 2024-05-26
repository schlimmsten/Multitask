import 'package:flutter/material.dart';
import 'package:multitask/Notifications/notif_saver.dart';
import 'package:multitask/Notifications/notifications_server.dart';
import 'package:multitask/settings_screen_components/switcher_class.dart';
import 'package:provider/provider.dart';
import 'package:multitask/themes/custom_theme.dart';


class SwitchersBuilder extends StatefulWidget {
  const SwitchersBuilder({super.key});

  @override
  State<SwitchersBuilder> createState() => _SwitchersBuilderState();
}

class _SwitchersBuilderState extends State<SwitchersBuilder> {
 @override
  Widget build(BuildContext context) {
    final customTheme = Provider.of<CustomTheme>(context);
    final noti = Provider.of<NotiSaver>(context);
    setState(() {
      
    });
    print(noti.isNoti);
    // print(customTheme.isDarkTheme);
    return Column(
      children: [
        SettingsRow(
            title: "Разрешить уведомления",
            initialValue: noti.isNoti,
            onChanged: (value) {
              noti.toggleNoti(value);
            },),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        SettingsRow(
            title: "Показывать расписание",
            initialValue: false,
            onChanged: (value) {
              
            },),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        SettingsRow(
            title: "Тёмная тема",
            initialValue: customTheme.isDarkTheme,
            onChanged: (value) {
              customTheme.toggleTheme(
                  value); // Используем метод экземпляра класса CustomTheme, предоставленного провайдером
            },),
        SizedBox(height: MediaQuery.of(context).size.height * 0.4),
      ],
    );
  }
}