import 'package:flutter/material.dart';
import 'package:multitask/text_style.dart';
import '../dropdown/dropdown_menu.dart' as dp;
import '../buttons/skip_button.dart';
import '../buttons/continue_button.dart';

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
            // Text(
            //   "Приложение MultiTask поможет вам отслеживать задачи и расписание на день.",
            //   textAlign: TextAlign.center,
            //   style: mainTextStyle(),
            // ),
            const SizedBox(height: 60),
            Text("Пожалуйста, укажите номер своей группы.",
                textAlign: TextAlign.center, style: mainTextStyle()),
            const SizedBox(height: 70),
            const dp.DropdownMenu(),
            const SizedBox(height: 150),
            const ContinueButton(),
            const SkipButton()
          ],
        ),
      ),
      //bottomNavigationBar: BottomNavigationBar()
    );
  }
}


