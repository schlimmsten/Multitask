import 'package:flutter/material.dart';
import 'package:multitask/screens/main_screen.dart';
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
            const SizedBox(height: 60),
            Text("Пожалуйста, укажите номер своей группы.",
                textAlign: TextAlign.center, style: mainTextStyle()),
            const SizedBox(height: 70),
            const dp.DropdownMenu(),
            const SizedBox(height: 150),
            const Button()
            // const Row(
            //   children: [
            //     OutlinedButton(
            //       child: Text("Пропустить",
            //         style: mainTextStyle()),
            //       style: OutlinedButton.styleFrom(
            //         side: BorderSide(
            //           color: Colors.black,
            //         ),
            //       ),
            //       onPressed: ,
            //     ),
            //   ],
            // )
          ],
        ),
      ),
      //bottomNavigationBar: BottomNavigationBar()
    );
  }
}

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  String text = 'Пропустить';
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.blue.shade900, width: 2)),
      onPressed: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const MainScreen()));
      },
      child: Text(
        text,
        style: smallTextStyle(),
      ),
    );
  }
}
