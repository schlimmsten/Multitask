import 'package:flutter/material.dart';
import '../text_style.dart';
import 'package:multitask/screens/main_screen.dart'; //просто заглушка

class DeclineButton extends StatelessWidget {
  const DeclineButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: OutlinedButton.styleFrom(side: const BorderSide(color: Color.fromARGB(255, 8, 4, 252), width: 2)),
      onPressed: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const MainScreen()));
      },
      child: Text(
        "Назад",
        style: smallTextStyle(),
      ),
    );
  }
}