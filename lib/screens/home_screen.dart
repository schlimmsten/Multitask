import 'package:flutter/material.dart';
import 'package:multitask/text_style.dart';
import '../dropdown/dropdown_menu.dart' as dp;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Приветствуем",
              style: headerTextStyle(),
            )),

        body: Container(
          padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
          child: Column(
            children: [
              Text(
                "Приложение MultiTask поможет вам отслеживать задачи и расписание на день.",
                textAlign: TextAlign.center,
                style: mainTextStyle(),
              ),
              const SizedBox(height: 40),
              Text("Пожалуйста, укажите номер своей группы.",
                  textAlign: TextAlign.center, style: mainTextStyle()),
              const SizedBox(height: 40),
              const dp.DropdownMenu(),
              const SizedBox(height: 40),
              const Row(
                children: [],
              )
            ],
          ),
        ),
        //bottomNavigationBar: BottomNavigationBar()
      );
  }
}
