import 'package:flutter/material.dart';
import 'package:multitask/change_screen_components/change_screen_builder.dart';

class ChangeScreen extends StatelessWidget {

  final int index;

  const ChangeScreen({super.key, required this.index});



  @override
  Widget build(BuildContext context) { return ChangeScreenBuilder(index: index); }
}