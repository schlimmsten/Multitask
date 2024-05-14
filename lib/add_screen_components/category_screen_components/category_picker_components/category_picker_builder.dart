import 'package:flutter/material.dart';
import 'package:multitask/add_screen_components/category_screen_components/new_category_components/new_category_builder.dart';
import 'package:multitask/add_screen_components/data_task/task_form_model.dart';
import 'package:multitask/text_style.dart';
import 'package:multitask/themes/custom_theme.dart';
import 'package:provider/provider.dart';

List<Map<String, dynamic>> categories = [
  {"name": "Учеба", "color": Colors.red},
  {"name": "Работа", "color": Colors.green},
  {"name": "Развлечения", "color": Colors.blue},
  {"name": "Добавить свою", "color": Colors.orange},
];

class CategoryPicker extends StatefulWidget {
  const CategoryPicker({Key? key}) : super(key: key);

  @override
  State<CategoryPicker> createState() => _CategoryPickerState();
}

class _CategoryPickerState extends State<CategoryPicker> {
  void _onCategoryDeleted(Map<String, dynamic> category) {
    setState(() {
      categories.remove(category);
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = TaskFormModelProvider.of(context)?.model;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          child: Text(
            "Выбрать категорию",
            style: smallalwaysblackTextStyle(context),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(
                  builder: (context, setState) {
                    return SimpleDialog(
                      title: Text(
                        'Выберите категорию',
                        style: mainalwaysblackTextStyle(context),
                      ),
                      children: categories.map((category) {
                        return SimpleDialogOption(
                            onPressed: () {
                              if (category["name"] == "Добавить свою") {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const NewCategoryBuilder();
                                  },
                                );
                              } else {
                                model?.category = category["name"];
                                model?.color = category["color"];
                                Navigator.of(context).pop();
                              }
                            },
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: category["color"],
                                  radius: 10,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  category["name"],
                                  style: smallalwaysblackTextStyle(context),
                                ),
                                const Spacer(),
                                (category["name"] != "Добавить свою")
                                    ? ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            categories.remove(category);
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: const CircleBorder(),
                                        ),
                                        child: Icon(
                                          Icons.close_outlined,
                                          color:
                                              Provider.of<CustomTheme>(context)
                                                      .isDarkTheme
                                                  ? Colors.white
                                                  : Colors.black,
                                        ),
                                      )
                                    : const Text("")
                              ],
                            ));
                      }).toList(),
                    );
                  },
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
