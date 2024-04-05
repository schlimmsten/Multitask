import 'package:flutter/material.dart';
import 'package:multitask/screens/main_screen.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          side: const BorderSide(
              color: Color.fromARGB(255, 8, 4, 252), width: 2)),
      onPressed: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const MainScreen()));
      },
      child: const Text(
        "Продолжить",
        style: TextStyle(
          fontSize: 18,
          fontFamily: "Montserrat",
          color: Colors.black,
        ),
      ),
    );
  }
}
