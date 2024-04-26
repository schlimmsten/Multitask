import 'package:flutter/material.dart';
import 'dropdown_menu.dart' as dp;
import 'package:multitask/screens/main_screen.dart';
import '../text_style.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const MainScreen()));
        dp.selectedItem = "";
      },
      child: Text(
        "Пропустить",
        style:skipbuttonTextStyle(context)
        
      ),
    );
  }
}