import 'package:flutter/material.dart';
import '../themes/custom_theme.dart';
import 'package:provider/provider.dart';
//прикрутить реальный функционал
class DescriptionField extends StatelessWidget {

  const DescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Введите описание задачи',
        hintStyle: TextStyle(
          fontSize: 16,
          fontFamily: "Montserrat",
          color: Provider.of<CustomTheme>(context).isDarkTheme?Colors.white:Colors.black,
        )
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