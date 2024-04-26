import 'package:flutter/material.dart';
import '../text_style.dart';
import 'package:multitask/screens/main_screen.dart'; //просто заглушка

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: OutlinedButton.styleFrom(side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor),
      
      onPressed: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const MainScreen()));
      },
      child: Text(
        "Добавить",
        style: addbuttonTextStyle(context)
      ),
    );
  }
}