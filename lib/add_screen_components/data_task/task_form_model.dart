import 'package:flutter/material.dart';
import '../../screens/main_screen.dart';

class TaskFormModel {
  var name = '';
  var description = '';
  var selectedDay = '';
  var selecyedMonth = '';
  var selectedYear = ''; // Поле для хранения выбранной даты
  var selectedTime = ''; // Поле для хранения выбранного времени
  var category = '';
  Color? color;
  void saveTask(BuildContext context) {
    // Вызов метода для сохранения задачи с выбранной датой и временем
    // Можно объединить их в один DateTime или оставить отдельно, в зависимости от потребностей приложения
    print(name);
    print(description);
    print('Дата: $selectedDay.$selecyedMonth.$selectedYear, Время: $selectedTime');
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => const MainScreen()));
  }
}

class TaskFormModelProvider extends InheritedWidget {
  final TaskFormModel model;
  const TaskFormModelProvider(
      {super.key, required super.child, required this.model});

  static TaskFormModelProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskFormModelProvider>();
  }

  @override
  bool updateShouldNotify(TaskFormModelProvider oldWidget) {
    return model.name != oldWidget.model.name ||
        model.description != oldWidget.model.description ||
        model.selectedTime != oldWidget.model.selectedTime ||
        model.category != oldWidget.model.category;
  }
}
