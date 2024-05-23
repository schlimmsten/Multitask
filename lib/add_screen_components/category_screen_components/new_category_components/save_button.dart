import 'package:flutter/material.dart';
import '../category_picker_components/category_picker.dart';
import 'category_name.dart';
import 'color_picker.dart';

class SaveButton extends StatelessWidget {

  final model;

  const SaveButton({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      //тут обновление виджета
      onPressed: () {
        if(CategoryName.textController.text != ''){
          model?.category = CategoryName.textController.text;
          model?.color = selectedColor;
          chosenCategory = {"name": CategoryName.textController.text, "color": selectedColor};
          categories.insert(categories.length-1,{"name": CategoryName.textController.text, "color": selectedColor});
          //сохранение pref
          saveCategories(categories);
          CategoryName.textController.text = '';
          Navigator.pop(context);
        }
        //надо вызывать CategoryPicker
        //const NewCategoryBuilder();
      }, 
      child: const Text("Сохранить",
        style: TextStyle(
        fontSize: 20,
        fontFamily: "Montserrat",
        color: Colors.black,
        ),
      )
    );
  }
}