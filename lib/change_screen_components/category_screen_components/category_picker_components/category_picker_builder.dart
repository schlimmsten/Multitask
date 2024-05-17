import 'package:flutter/material.dart';
import 'package:multitask/add_screen_components/category_screen_components/new_category_components/new_category_builder.dart';
import 'package:multitask/text_style.dart';
import 'category.dart';
//РАСЧЛЕНИТЬ!!!
//можно как то пересобрать этот ужас?
//добавить кнопку удаления

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
                  //менять и обрабатывать при выборе эту хуистику
                  title: Text(
                    'Выберите категорию',
                    style: mainalwaysblackTextStyle(context)
                  ),
                  //ВОТ ТУТ НАСТРОИТЬ НАЖАТИЕ ИМЕННО НА "Добавить свою" !!!
                  //тут мы оформляем это все как список!!!!
                  children: categories.map((category) {
                    return SimpleDialogOption(
                      onPressed: () {
                        //вот тут разветвление
                        if (category["name"] == "Добавить свою"){
                          Navigator.of(context).pop();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const NewCategoryBuilder();
                            },
                          );
                          }
                        else{
                          //замена выбрать категорию другим виджетом? как то связать через логику появление виджета?
                          //или мы будем его просто менять по факту
                          Navigator.of(context).pop();
                        }
                      },
                      child: Category(category : category),
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

