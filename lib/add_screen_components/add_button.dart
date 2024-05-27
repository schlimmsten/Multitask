import 'package:flutter/material.dart';
//просто заглушка
import '../text_style.dart';
import './data_task/task_form_model.dart';
//import 'save_task.dart';


class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () =>TaskFormModelProvider.of(context)?.model.saveTask(context),
      style: OutlinedButton.styleFrom(side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor),
      child: Text(
        "Добавить",
        style: addbuttonTextStyle(context)
      ),
    );
  }
}