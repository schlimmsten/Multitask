import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multitask/add_screen_components/data_task/task.dart';

class TaskModel extends ChangeNotifier
{
  var _tasks = <Task>[];
  List<Task> get tasks => _tasks.toList();

  TaskModel(){
    setup();
  }

  void _readTasksFromHive(Box <Task> box){
    _tasks = box.values.toList();
    notifyListeners();
  }

  void deleteItemBox(int index) async{
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(TaskAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(ColorAdapter());
    }

    final box = await Hive.openBox<Task>('tasks_box');
    await box.deleteAt(index);
  }
  void setup() async{
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(TaskAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(ColorAdapter());
    }

    final box = await Hive.openBox<Task>('tasks_box');
    _readTasksFromHive(box);
    box.listenable().addListener(()=>_readTasksFromHive(box));
  }
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
