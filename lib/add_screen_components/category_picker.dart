import 'package:flutter/material.dart';
import 'package:multitask/add_screen_components/new_category.dart';
import 'package:multitask/text_style.dart';
//можно как то пересобрать этот ужас?

List<Map<String, dynamic>> categories = [
  {"name": "Учеба", "color": Colors.red},
  {"name": "Работа", "color": Colors.green},
  {"name": "Развлечения", "color": Colors.blue},
  {"name": "Добавить свою", "color": Colors.orange},
];

class CategoryPicker extends StatefulWidget {
  const CategoryPicker({super.key});

  @override
  State<CategoryPicker> createState() => _CategoryPickerState();
}

//убрать диалог, раскидать на виджеты, добавить виджет создания новой категории
//изменение самого виджета выбора категории при выборе
class _CategoryPickerState extends State<CategoryPicker> {
    @override
    Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          child: Text(
            "Выбрать категорию",
            style: smallalwaysblackTextStyle(context)
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  title: Text(
                    'Выберите категорию',
                    style: mainalwaysblackTextStyle(context)
                  ),
                  children: categories.map((category) {
                    return SimpleDialogOption(
                      onPressed: () {
                        
                        Navigator.of(context).pop();
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const NewCategory(
                            );
                          },
                        );
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                              backgroundColor: category["color"], radius: 10),
                          const SizedBox(width: 10),
                          Text(
                            category["name"],
                            style: smallalwaysblackTextStyle(context)
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              },
            );
          },
        ),
        const SizedBox(width: 10),
      ],
    );
  }
  }

