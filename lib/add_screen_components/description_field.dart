import 'package:flutter/material.dart';
import 'package:multitask/add_screen_components/data_task/task_form_model.dart';
import '../text_style.dart';
//прикрутить реальный функционал
class DescriptionField extends StatelessWidget {

  const DescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
    final model = TaskFormModelProvider.of(context)?.model;
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Введите описание задачи',
        hintStyle: addfuelsTextStyle(context)
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Пожалуйста введите описание задачи';
        }
          return null;
      },
      onChanged: (value) => model?.description = value,
    );
  }
}