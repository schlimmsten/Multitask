import 'package:flutter/material.dart';
import '../text_style.dart';
//прикрутить реальный функционал
class DescriptionField extends StatelessWidget {

  const DescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
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
    );
  }
}