import 'package:flutter/material.dart';
import '../text_style.dart';
//можно как то пересобрать этот ужас?

List<Map<String, dynamic>> categories = [
  {"name": "Учеба", "color": Colors.red},
  {"name": "Работа", "color": Colors.green},
  {"name": "Развлечения", "color": Colors.blue},
  {"name": "Добавить свою", "color": Colors.orange},
];

class CategoryPicker extends StatelessWidget {
  const CategoryPicker({super.key});

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
