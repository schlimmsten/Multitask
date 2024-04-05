import 'package:flutter/material.dart';

//прикрутить реальный функционал
class DescriptionField extends StatelessWidget {

  const DescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Введите описание задачи',
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