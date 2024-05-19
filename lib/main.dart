import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'multitask_app.dart';
import 'package:provider/provider.dart';
import 'package:multitask/themes/custom_theme.dart';
//это будем стягивать

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  runApp(
    
    ChangeNotifierProvider<CustomTheme>(
      create: (_) => CustomTheme(),
      child: const MultitaskApp(),
    ),
  );
}

