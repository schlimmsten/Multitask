import 'package:flutter/material.dart';
import '../themes/custom_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class NewCategory extends StatefulWidget {
  const NewCategory({super.key});

  @override
  State<NewCategory> createState() => _NewCategoryState();
}

class _NewCategoryState extends State<NewCategory> {
  ColorSwatch<int>? selectedColor = Colors.orange;
  @override
  Widget build(BuildContext context) {
      return Dialog(
        child: Column(
          //размерность!!!
          mainAxisSize: MainAxisSize.min,
          children: [
            //вот под это можно будет переделать description_field
            TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 65),
                hintText: 'Введите название...',
                hintStyle: TextStyle(
                  fontSize: 20,
                  fontFamily: "Montserrat",
                  color: Provider.of<CustomTheme>(context).isDarkTheme?Colors.white:Colors.black,
                  )
                ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста введите название...';
                }
                return null;
              },
            ),
            const SizedBox(height: 20,),
            //color_picker
            MaterialColorPicker(
              selectedColor: selectedColor,
              allowShades: false,
              onMainColorChange: (color) {
                setState(() {
                  selectedColor = color as ColorSwatch<int>;
                });
              },
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {Navigator.of(context).pop();}, 
              child: Text("Сохранить",
                style: TextStyle(
                fontSize: 20,
                fontFamily: "Montserrat",
                color: Provider.of<CustomTheme>(context).isDarkTheme?Colors.white:Colors.black,
                ),
              )
            ),
        ],),
    );
  }
}