import 'package:flutter/material.dart';
import 'package:multitask/add_screen_components/data_task/task_form_model.dart';
import '../themes/custom_theme.dart';
import 'package:provider/provider.dart';
class NameField extends StatefulWidget {

  const NameField({super.key});

  @override
  NameFieldState createState() => NameFieldState();
}

class NameFieldState extends State<NameField> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = TaskFormModelProvider.of(context)?.model;
    return TextFormField(
      controller: _textEditingController,
      style: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold,
        fontFamily: "Montserrat",
        color: Provider.of<CustomTheme>(context).isDarkTheme ? Colors.white : Colors.black,
      ),
      decoration: InputDecoration(
        hintText: 'Введите название задачи',
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
      onChanged:(value) {
        setState(() {
          model?.name = value; // Обновление модели задачи при изменении текста
        });
      },
      validator: (String? value) {
        setState(() {
          
        });
        if (value == null || value.isEmpty) {
          return 'Пожалуйста, введите название задачи';
        }
        return null;
        
      },
      
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
