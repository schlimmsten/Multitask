import 'package:flutter/material.dart';
import 'package:multitask/add_screen_components/data_task/task_form_model.dart';
import '../themes/custom_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/painting/edge_insets.dart';
//прикрутить реальный функционал
class DescriptionField extends StatelessWidget {

  const DescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
    final model = TaskFormModelProvider.of(context)?.model;
    return TextFormField(
      style: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold,
        fontFamily: "Montserrat",
        color: Provider.of<CustomTheme>(context).isDarkTheme ? Colors.white : Colors.black,
      ),
      decoration: InputDecoration(
        hintText: 'Введите описание задачи',
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          fontFamily: "Montserrat",
          color: Provider.of<CustomTheme>(context).isDarkTheme ? Colors.white : Colors.black,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Provider.of<CustomTheme>(context).isDarkTheme ? Colors.white : Colors.black),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
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