import 'package:flutter/material.dart';

//прикрутить реальный функционал
class NameField extends StatelessWidget {

  const NameField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Введите название задачи',
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