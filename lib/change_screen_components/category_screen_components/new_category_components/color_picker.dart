import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

ColorSwatch<int>? selectedColor = Colors.orange;

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key});

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return MaterialColorPicker(
      selectedColor: selectedColor,
      allowShades: false,
      onMainColorChange: (color) {
        setState(() {
          selectedColor = color as ColorSwatch<int>;
        });
      },
    );
  }
}