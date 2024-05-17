import 'package:flutter/material.dart';
import 'package:multitask/add_screen_components/category_screen_components/new_category_components/new_category_builder.dart';
import 'package:multitask/text_style.dart';
import 'package:multitask/themes/custom_theme.dart';
import 'package:provider/provider.dart';

List<Map<String, dynamic>> categories = [
  {"name": "Учеба", "color": Colors.red},
  {"name": "Работа", "color": Colors.green},
  {"name": "Развлечения", "color": Colors.blue},
  {"name": "Добавить свою", "color": Colors.orange},
];

Map<String, dynamic> ?chosenCategory;

class CategoryPicker extends StatefulWidget {

  final VoidCallback onPressed;

  const CategoryPicker({super.key, required this.onPressed});

  @override
  State<CategoryPicker> createState() => _CategoryPickerState();
}

class _CategoryPickerState extends State<CategoryPicker> {

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          //по идее тут разветвление и как то надо определять выбрано
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(color: (chosenCategory == null) ? Colors.white : chosenCategory!["color"],
                  width: 2.0,
                )
              )
            )
          ),
          child: 
          Text(
            (chosenCategory == null) ? "Выбрать категорию" : chosenCategory!["name"],
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
                              //по идее тут сохраняем выбранную категорию
                              if (category["name"] == "Добавить свою") {
                                Navigator.of(context).pop();
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const NewCategoryBuilder();
                                  },
                                );
                              } else {
                                chosenCategory = category;
                                widget.onPressed();
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
