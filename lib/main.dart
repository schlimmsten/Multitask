import 'package:flutter/material.dart';
import 'multitask_app.dart';
import 'package:provider/provider.dart';
import 'package:multitask/themes/custom_theme.dart';
//это будем стягивать

void main() {
  runApp(
    ChangeNotifierProvider<CustomTheme>(
      create: (_) => CustomTheme(),
      child: const MultitaskApp(),
    ),
  );
}

