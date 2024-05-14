import 'package:flutter/material.dart';

class TaskModel extends ChangeNotifier
{
  
}

class TaskModelProvider extends InheritedNotifier {
  final TaskModel model;
  const TaskModelProvider(
      {super.key, required super.child, required this.model})
      : super(notifier: model);

  static TaskModelProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskModelProvider>();
  }
}
