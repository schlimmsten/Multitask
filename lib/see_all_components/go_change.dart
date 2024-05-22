import 'package:flutter/material.dart';
//просто заглушка
import '../change_screen_components/change_screen_builder.dart';
import '../text_style.dart';
import '../add_screen_components/data_task/task_form_model.dart';
import '../main_screen_components/task_list.dart';



class GoChangeButton extends StatelessWidget {

  final int index;

  const GoChangeButton({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeScreenBuilder(index: index),));
      },
      style: OutlinedButton.styleFrom(side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor),
      child: Text(
        "Изменить",
        style: addbuttonTextStyle(context)
      ),
    );
  }
}