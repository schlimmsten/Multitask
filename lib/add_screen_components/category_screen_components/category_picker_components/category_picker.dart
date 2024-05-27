import 'package:flutter/material.dart';
import 'package:multitask/add_screen_components/category_screen_components/new_category_components/new_category_builder.dart';
import 'package:multitask/text_style.dart';
import '../../data_task/task_form_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

List<Map<String, dynamic>> categories = [];

Future<void> saveCategories(List<Map<String, dynamic>> categoriesInput) async {
  final prefs = await SharedPreferences.getInstance();
  categoriesInput = convertToNums(categoriesInput);
  final categoriesJson = jsonEncode(categoriesInput);
  prefs.setString('categories', categoriesJson);
}

List<Map<String, dynamic>> convertToNums(
    List<Map<String, dynamic>> categories) {
  return categories.map((category) {
    Color color = category["color"];
    int colorValue = color.value;
    return {
      "name": category["name"],
      "color": colorValue,
    };
  }).toList();
}

Future<void> getCategories() async {
  final prefs = await SharedPreferences.getInstance();
  final categoriesJson = prefs.getString('categories');
  if (categoriesJson != null) {
    final categoriesList = jsonDecode(categoriesJson) as List;
    categories = categoriesList.map((e) => e as Map<String, dynamic>).toList();
    categories = convertToColors(categories);
  } else {
    categories = [
      {"name": "Учеба", "color": Colors.red[300]},
      {"name": "Работа", "color": Colors.green[300]},
      {"name": "Развлечения", "color": Colors.blue[300]},
      {"name": "Добавить свою", "color": Colors.orange[300]},
    ];
  }
}

List<Map<String, dynamic>> convertToColors(
    List<Map<String, dynamic>> categories) {
  return categories.map((category) {
    Color color = Color(category["color"]);
    return {
      "name": category["name"],
      "color": color,
    };
  }).toList();
}

Map<String, dynamic>? chosenCategory;

class CategoryPicker extends StatefulWidget {
  final VoidCallback onPressed;
  final TaskFormModel model;

  const CategoryPicker(
      {super.key, required this.onPressed, required this.model});

  @override
  // ignore: no_logic_in_create_state
  State<CategoryPicker> createState() {
    final state = CategoryPickerState();
    model.categoryPicker = state;
    return state;
  }
}

class CategoryPickerState extends State<CategoryPicker> {
  String? _errorText;
  @override
  void initState() {
    super.initState();
    getCategories(); // Загружаем категории при инициализации
  }

  // void loadCategories() async {
  //   await getCategories(); // Дожидаемся завершения загрузки категорий
  //   setState(() {}); // Обновляем UI после загрузки категорий
  // }

  @override
  Widget build(BuildContext context) {
    final model = TaskFormModelProvider.of(context)?.model;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            ElevatedButton(
              //по идее тут разветвление и как то надо определять выбрано
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(
                            color: (chosenCategory == null)
                                ? Colors.white
                                : chosenCategory!["color"],
                            width: 2.0,
                          )))),
              child: Text(
                (chosenCategory == null)
                    ? "Выбрать категорию"
                    : chosenCategory!["name"],
                style: smallalwaysblackTextStyle(context),
                //ТУТ!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return SimpleDialog(
                          //ТУТ!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                          title: Text(
                            'Выберите категорию',
                            style: mainalwaysblackTextStyle(context),
                            //ТУТ!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
                                        return NewCategoryBuilder(model: model);
                                      },
                                    );
                                  } else {
                                    model?.category = category["name"];
                                    model?.color = category["color"];
                                    chosenCategory = category;
                                    widget.onPressed();
                                    Navigator.of(context).pop();
                                    setState((){
                                       _errorText = null;
                                    });
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
                                      //ТУТ!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                    ),
                                    const Spacer(),
                                    (category["name"] != "Добавить свою")
                                        //удаление из shared pref
                                        ? ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                categories.remove(category);
                                                saveCategories(categories);
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: const CircleBorder(),
                                            ),
                                            child: const Icon(
                                                Icons.close_outlined,
                                                color: Colors.black),
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
            if (_errorText != null)
              Text(
                _errorText!,
                style: const TextStyle(color: Color.fromARGB(255, 169, 46, 37)),
              ),
          ],
        ),
        const SizedBox(width: 10),
      ],
    );
  }
  String? _validateDateTime(Map<String, dynamic>? category) {
    if (category == null) {
      return 'Пожалуйста, выберите категорию';
    }
    return null;
  }
  String? validateCategory() {
    setState(() {
      _errorText = _validateDateTime(chosenCategory);
    });
    return _errorText;
  }

  void setErrorText(String? errorText) {
    setState(() {
      _errorText = errorText;
    });
  }
}
