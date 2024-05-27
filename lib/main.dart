import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multitask/add_screen_components/data_task/task.dart';
import 'package:multitask/add_screen_components/data_task/task_model.dart';
import 'package:multitask/internet/database/lesson.dart';
import 'package:multitask/local_notifications.dart';
import 'multitask_app.dart';
import 'package:provider/provider.dart';
import 'package:multitask/themes/custom_theme.dart';
//это будем стягивать

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Notifications.init();
  Hive.initFlutter();

  // var taskBox = await Hive.openBox<Task>('tasks_box');
  // var lessonBox = await Hive.openBox<Lesson>('lesson_box');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CustomTheme>(
          create: (_) => CustomTheme(),
        ),
        ChangeNotifierProvider<TaskModel>(
          create: (_) => TaskModel(),
        ),
      ],
      child: const MultitaskApp(),
    ),
  );
}

