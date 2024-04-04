import 'package:flutter/material.dart';
import '../text_style.dart';
import 'package:multitask/screens/main_screen.dart';
import 'package:multitask/settings_screen_components/line.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

//возможно стоит использовать предидущие компоненты кнопок? хотя у них нет функционала

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          title: Text(
              "Добавление задачи",
              textAlign: TextAlign.center,
              style: headerTextStyle(),
            ),
        centerTitle: true,
      ),

      body: Container(

        padding: const EdgeInsets.only(left: 10, right: 10),
        
        child: Column(
          children: [
            // верхняя полоска
            const Line(),
            //текст для названия
            const SizedBox(height: 40),

            Text(
              "Название:",
              textAlign: TextAlign.right,
              style: mainTextStyle(),
            ),

            // поле для ввода названия
            const SizedBox(height: 10),

            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Введите название задачи',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста, введите название задачи';
                }
                return null;
              },
            ),

            //текст 
            const SizedBox(height: 40),

            Text(
              "Описание:",
              textAlign: TextAlign.left,
              style: mainTextStyle(),
            ),

            const SizedBox(height: 10),

            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Ведите описание задачи',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста введите описание задачи';
                }
                return null;
              },
            ),

          // категории
          // тут основная работа
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          title: const Text('Выберите категорию'),
                          children: categories.map((category) {
                            return SimpleDialogOption(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Row(
                                children: [
                                  CircleAvatar(backgroundColor: category["color"], radius: 10),
                                  const SizedBox(width: 10),
                                  Text(category["name"]),
                                ],
                              ),
                            );
                          }).toList(),
                        );
                      },
                    );
                  },
                  child: Text(
                    "Выбрать категорию",
                    style: smallTextStyle(),
                  ),
                ),
                const SizedBox(width: 10),
                
              ],
            ),

            //ДОЛЖНА ИДТИ КАК ROW!!! че это за слова ё?

            ElevatedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2050),
                ).then((selectedDate) {
                  if (selectedDate != null) {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((selectedTime) {
                      if (selectedTime != null) {
                      }
                    });
                  }
                });
              },
              child: Text(
                "Выбрать дату и время выполнения",
                style: smallTextStyle(),
              ),
            ),
         
            const SizedBox(height: 230),
            
            const Line(),

            //кнопка добавления, пока не трогаем функционал
            ElevatedButton(
              style: OutlinedButton.styleFrom(side: const BorderSide(color: Color.fromARGB(255, 8, 4, 252), width: 2)),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const MainScreen()));
              },
              child: Text(
                "Добавить",
                style: smallTextStyle(),
              ),
            ),
            
            //кнопка назад, функционал правильный
            ElevatedButton(
              style: OutlinedButton.styleFrom(side: const BorderSide(color: Color.fromARGB(255, 8, 4, 252), width: 2)),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const MainScreen()));
              },
              child: Text(
                "Назад",
                style: smallTextStyle(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> categories = [
  {"name": "Учеба", "color": Colors.red},
  {"name": "Работа", "color": Colors.green},
  {"name": "Развлечения", "color": Colors.blue},
  {"name": "Добавить свою", "color": Colors.orange},
];



