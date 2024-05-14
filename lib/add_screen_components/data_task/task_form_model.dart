import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:multitask/add_screen_components/data_task/task.dart';
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
  void saveTask(BuildContext context) async {
    // Вызов метода для сохранения задачи с выбранной датой и временем
    // Можно объединить их в один DateTime или оставить отдельно, в зависимости от потребностей приложения
    // print(name);
    // print(description);
    // print('Дата: $selectedDay.$selecyedMonth.$selectedYear, Время: $selectedTime');
    // print(category);
    // print(color);
    if (name.isEmpty) return;
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(TaskAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(ColorAdapter());
    }

    final box = await Hive.openBox<Task>('tasks_box');
    final task = Task(
        name: name,
        description: description,
        selectedDay: selectedDay,
        selectedMonth: selecyedMonth,
        selectedTime: selectedTime,
        selectedYear: selectedYear,
        category: category,
        color: color);
    await box.add(task);
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

  bool updateShouldNotify(TaskFormModelProvider oldWidget) {
    return model.name != oldWidget.model.name ||
        model.description != oldWidget.model.description ||
        model.selectedDay != oldWidget.model.selectedDay ||
        model.selecyedMonth != oldWidget.model.selecyedMonth ||
        model.selectedYear != oldWidget.model.selectedYear ||
        model.selectedTime != oldWidget.model.selectedTime ||
        model.category != oldWidget.model.category ||
        model.color != oldWidget.model.color;
  }
}
