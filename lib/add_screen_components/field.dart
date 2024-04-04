import 'package:flutter/material.dart';

class Field extends StatelessWidget {

  final String label;
  const Field({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
              decoration: const InputDecoration(
                hintText: label,
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