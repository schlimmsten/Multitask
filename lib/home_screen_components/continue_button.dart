import 'package:flutter/material.dart';
import 'package:multitask/home_screen_components/dropdown_menu.dart';
import 'package:multitask/internet/fetch_data.dart';
import 'package:multitask/screens/main_screen.dart';
import '../text_style.dart';


class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key});

  

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          side: BorderSide(color: Theme.of(context).primaryColor, width: 2)),
      onPressed: (){
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const MainScreen()));
        fetchData();
        //print(items);
      },
      child: Text(
        "Продолжить",
        style: addbuttonTextStyle(context),
      ),
    );
  }
}
