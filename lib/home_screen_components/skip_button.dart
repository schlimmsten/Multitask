import 'package:flutter/material.dart';
import 'package:multitask/screens/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../text_style.dart';
import 'dropdown_menu.dart' as dp;

class SkipButton extends StatelessWidget {
  
  const SkipButton({super.key});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        dp.selectedItem = "";
        dp.saveSelectedItem(dp.selectedItem);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const MainScreen()));
        // Не сохраняем выбранное значение
      },
      child: Text(
        "Пропустить",
        style: skipbuttonTextStyle(context),
      ),
    );
  }
}
