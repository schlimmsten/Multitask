import 'package:flutter/material.dart';
import 'package:multitask/add_screen_components/add_screen_builder.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

//возможно стоит использовать предидущие компоненты кнопок? хотя у них нет функционала

  @override
  Widget build(BuildContext context) { return const AddScreenBuilder(); }
}

