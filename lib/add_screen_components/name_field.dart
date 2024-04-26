import 'package:flutter/material.dart';
import '../text_style.dart';
//прикрутить реальный функционал
class NameField extends StatelessWidget {

  const NameField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Введите название задачи',
        hintStyle: addfuelsTextStyle(context)
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Пожалуйста, введите название задачи';
        }
        return null;
      },
    );
  }
}