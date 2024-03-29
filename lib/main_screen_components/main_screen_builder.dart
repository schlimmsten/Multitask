import 'package:flutter/material.dart';
import 'add_button.dart';
import 'date_builder.dart';
import 'day_builder.dart';

class MainScreenBuilder extends StatefulWidget {
  const MainScreenBuilder({super.key});

  @override
  State<MainScreenBuilder> createState() => _MainScreenBuilderState();
}

class _MainScreenBuilderState extends State<MainScreenBuilder> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SizedBox(height: 10),
          DayBuilder(),
          DateBuilder(),
          SizedBox(height: 540),
          AddButton()
        ],
      ),
    );
  }
}