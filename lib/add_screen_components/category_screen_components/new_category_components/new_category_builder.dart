import 'package:flutter/material.dart';
import 'category_name.dart';
import 'color_picker.dart';
import 'save_button.dart';

//РАСЧЛЕНИТЬ!!!
//это кнопка добавить свою, сюда пока не лезь

class NewCategoryBuilder extends StatefulWidget {

  final model;

  const NewCategoryBuilder({super.key, required this.model});

  @override
  State<NewCategoryBuilder> createState() => _NewCategoryState();

}

class _NewCategoryState extends State<NewCategoryBuilder> {

  @override
  Widget build(BuildContext context) {
      return Dialog(
        child: Column(
          //размерность!!!
          mainAxisSize: MainAxisSize.min,
          children: [
            //вот под это можно будет переделать description_field
            const CategoryName(),
            const SizedBox(height: 20,),
            //color_picker
            const ColorPicker(),
            const SizedBox(height: 20,),
            SaveButton(model: widget.model,),
        ],),
    );
  }
}