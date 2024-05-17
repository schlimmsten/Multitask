import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../themes/custom_theme.dart';
import '../category_picker_components/category_picker_builder.dart';
import 'category_name.dart';
import 'color_picker.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        categories.insert(categories.length-1,{"name": CategoryName.textController.text, "color": selectedColor});
        CategoryName.textController.text = '';
        Navigator.of(context).pop();
      }, 
      child: Text("Сохранить",
        style: TextStyle(
        fontSize: 20,
        fontFamily: "Montserrat",
        color: Provider.of<CustomTheme>(context).isDarkTheme?Colors.white:Colors.black,
        ),
      )
    );
  }
}