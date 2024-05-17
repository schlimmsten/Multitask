import 'package:flutter/material.dart';
import 'task_list.dart';
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

  const MainScreenBuilder({super.key, this.taskName, this.dateTime});

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( // Используем Stack для размещения виджетов один над другим
        children: [
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              const DateBuilder(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              const Expanded(child: TaskListWidget()), // Занимает всё доступное пространство
            ],
          ),
          const Positioned( // Позиционируем AddButton поверх TaskListWidget
            bottom: 100,
            right: 0,
            left: 0,
            child: AddButton(),
          ),
        ],
      ),
    );
  }
}


