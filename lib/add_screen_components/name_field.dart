import 'package:flutter/material.dart';
import '../themes/custom_theme.dart';
import 'package:provider/provider.dart';
//прикрутить реальный функционал
class NameField extends StatelessWidget {

  const NameField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Введите название задачи',
        hintStyle: TextStyle(
          fontSize: 16,
          fontFamily: "Montserrat",
          color: Provider.of<CustomTheme>(context).isDarkTheme?Colors.white:Colors.black,
        )
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