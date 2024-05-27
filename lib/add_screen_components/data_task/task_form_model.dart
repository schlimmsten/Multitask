import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:multitask/Notifications/notif_saver.dart';
import 'package:multitask/Notifications/notifications_server.dart';
import 'package:multitask/add_screen_components/category_screen_components/category_picker_components/category_picker.dart';
import 'package:multitask/add_screen_components/data_task/task.dart';
import 'package:multitask/add_screen_components/date_picker.dart';
import 'package:provider/provider.dart';

class TaskFormModel {
  var name = '';
  var description = '';
  var selectedDay = '';
  var selecyedMonth = '';
  var selectedYear = ''; // Поле для хранения выбранной даты
  var selectedTime = ''; // Поле для хранения выбранного времени
  var category = '';
  Color? color;
  DateTime? day;
  DatePickerState? datePickerState;
  CategoryPickerState? categoryPicker;

  void saveTask(BuildContext context, GlobalKey<FormState> formKey) async {
    String? dateTimeError = datePickerState!.validateDateTime();
    String? categoryError = categoryPicker!.validateCategory();
    if (dateTimeError != null) {
      // Показать сообщение об ошибке или обработать ее как необходимо
      print(dateTimeError);
      datePickerState!.setErrorText(dateTimeError);
      if (!formKey.currentState!.validate()) {
        if (categoryError != null) {
          print(dateTimeError);
          categoryPicker!.setErrorText(categoryError);
        }
        return;
      }
      return;
    }

    formKey.currentState!.save();

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
      color: color,
      time: day,
    );
    await box.add(task);
    final noti = Provider.of<NotiSaver>(context, listen: false);
    if (noti.isNoti &&
        task.time!.day == DateTime.now().day &&
        task.time!.month == DateTime.now().month &&
        task.time!.year == DateTime.now().year) {
      Notifications.scheduleNotification(
          title: task.name, id: task.id! * 1000, date: task.time!);
    }

    print(task.time);
    Navigator.of(context).pop(context);
  }

  void changeTask(BuildContext context, int index, GlobalKey<FormState> formKey) async {
    String? dateTimeError = datePickerState!.validateDateTime();
    String? categoryError = categoryPicker!.validateCategory();
    if (dateTimeError != null) {
      // Показать сообщение об ошибке или обработать ее как необходимо
      print(dateTimeError);
      datePickerState!.setErrorText(dateTimeError);
      if (!formKey.currentState!.validate()) {
        if (categoryError != null) {
          print(dateTimeError);
          categoryPicker!.setErrorText(categoryError);
        }
        return;
      }
      return;
    }

    formKey.currentState!.save();

    print(name);
    print(index);
    if (name.isEmpty || day == null) return;
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
      color: color,
      time: day,
    );
    await box.putAt(index, task);
    Navigator.of(context).pop(context);
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
        model.selectedDay != oldWidget.model.selectedDay ||
        model.selecyedMonth != oldWidget.model.selecyedMonth ||
        model.selectedYear != oldWidget.model.selectedYear ||
        model.selectedTime != oldWidget.model.selectedTime ||
        model.category != oldWidget.model.category ||
        model.color != oldWidget.model.color;
  }
}
