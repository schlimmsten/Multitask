import 'package:flutter/material.dart';
//просто заглушка
import '../text_style.dart';
import '../add_screen_components/data_task/task_form_model.dart';


class ChangeButton extends StatelessWidget {

  final int index;
  final GlobalKey<FormState> formKey;
  const ChangeButton({super.key, required this.index, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
          TaskFormModelProvider.of(context)
              ?.model
              .changeTask(context, index, formKey);
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