import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multitask/Notifications/notif_saver.dart';
import 'package:multitask/Notifications/notifications_server.dart';
import 'package:multitask/add_screen_components/data_task/task_model.dart';
import 'multitask_app.dart';
import 'package:provider/provider.dart';
import 'package:multitask/themes/custom_theme.dart';
//это будем стягивать

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  await Notifications.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CustomTheme>(
          create: (_) => CustomTheme(),
        ),
        ChangeNotifierProvider<TaskModel>(
          create: (_) => TaskModel(),
        ),
        ChangeNotifierProvider<NotiSaver>(
          create: (_) => NotiSaver(),
        )
      ],
      child: const MultitaskApp(),
    ),
  );
}
