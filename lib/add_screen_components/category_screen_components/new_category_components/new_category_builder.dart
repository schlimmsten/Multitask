import 'package:flutter/material.dart';
import 'category_name.dart';
import 'color_picker.dart';
import 'save_button.dart';

//РАСЧЛЕНИТЬ!!!
//это кнопка добавить свою, сюда пока не лезь

class NewCategoryBuilder extends StatefulWidget {
  const NewCategoryBuilder({super.key});

  @override
  State<NewCategoryBuilder> createState() => _NewCategoryState();
}

class _NewCategoryState extends State<NewCategoryBuilder> {
  @override
  Widget build(BuildContext context) {
      return const Dialog(
        child: Column(
          //размерность!!!
          mainAxisSize: MainAxisSize.min,
          children: [
            //вот под это можно будет переделать description_field
            CategoryName(),
            SizedBox(height: 20,),
            //color_picker
            ColorPicker(),
            SizedBox(height: 20,),
            SaveButton(),
        ],),
    );
  }
}