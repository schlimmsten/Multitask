import 'package:flutter/material.dart';
import 'add_button.dart';
import 'date_builder.dart';

/*
class MainScreenBuilder extends StatefulWidget {
  const MainScreenBuilder({super.key});

  @override
  State<MainScreenBuilder> createState() => _MainScreenBuilderState();
}

class _MainScreenBuilderState extends State<MainScreenBuilder> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10),
          //const DayBuilder(),
          const DateBuilder(),
          SizedBox(height: screenHeight * 0.65), // Расстояние между DateBuilder и AddButton
          const AddButton(),
        ],
      ),
    );
  }
}
*/

class MainScreenBuilder extends StatelessWidget {
  final String? taskName;
  final DateTime? dateTime;

  const MainScreenBuilder({Key? key, this.taskName, this.dateTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10),
          const DateBuilder(),
          SizedBox(height: screenHeight * 0.65), // Расстояние между DateBuilder и AddButton
          const AddButton(),
        ],
      ),
    );
  }
}


