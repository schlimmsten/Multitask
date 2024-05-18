import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multitask/add_screen_components/data_task/task.dart';

class TaskModel extends ChangeNotifier {
  final _tasks = <Task>[];
  final _completedtasks = <Task>[];

  List<Task> get completedtasks => _completedtasks.toList();
  List<Task> get tasks => _tasks.toList();

  TaskModel() {
    setup();
  }

  void _readTasksFromHive(Box<Task> box) {
    _completedtasks.clear();
    _tasks.clear();
    for (var key in box.keys) {
      var task = box.get(key)!;
      task.id = key; // Установите id задачи
      if (task.isSelected) {
        _completedtasks.add(task);
      } else {
        _tasks.add(task);
      }
    }
    notifyListeners();
  }
  Future<void> clearCompletedTasks() async {
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(TaskAdapter());
  }
  if (!Hive.isAdapterRegistered(2)) {
    Hive.registerAdapter(ColorAdapter());
  }

  final box = await Hive.openBox<Task>('tasks_box');
  final completedTaskIds = _completedtasks.map((task) => task.id).toList();
  
  for (var taskId in completedTaskIds) {
    await box.delete(taskId);
  }

  _completedtasks.clear(); // Очистка локального списка выполненных задач
  notifyListeners();
}


  void deleteItemBox(Task task) async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(TaskAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(ColorAdapter());
    }

    final box = await Hive.openBox<Task>('tasks_box');
    await box.delete(task.id); // Удаление задачи по id
    _readTasksFromHive(box);
  }

  void setup() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(TaskAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(ColorAdapter());
    }

    final box = await Hive.openBox<Task>('tasks_box');
    _readTasksFromHive(box);
    box.listenable().addListener(() => _readTasksFromHive(box));
  }

  Future<void> updateTaskStatus(Task task, bool isSelected) async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(TaskAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(ColorAdapter());
    }

    final box = await Hive.openBox<Task>('tasks_box');
    task.isSelected = isSelected;
    await box.put(task.id, task);
    _readTasksFromHive(box);
  }
}

class TaskModelProvider extends InheritedNotifier {
  final TaskModel model;
  const TaskModelProvider({super.key, required super.child, required this.model})
      : super(notifier: model);

  static TaskModelProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskModelProvider>();
  }
}
