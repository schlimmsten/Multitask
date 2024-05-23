import 'package:flutter/material.dart'; 
import 'package:multitask/settings_screen_components/line.dart'; 
import 'task_list.dart'; 
import 'add_button.dart'; 
import 'date_builder.dart'; 
 
class MainScreenBuilder extends StatelessWidget { 
  final void Function(DateTime) onDateScrolled; 
  final DateTime selectedDate; 
  final GlobalKey<DateBuilderState> dateBuilderKey = GlobalKey<DateBuilderState>(); // Добавляем ключ 
 
  MainScreenBuilder({super.key, required this.onDateScrolled, required this.selectedDate}); 
 
  void onDateSelected(DateTime newDate) { 
    onDateScrolled(newDate); 
  } 
 
  void goToSelectedWeek(DateTime newDate) { 
    dateBuilderKey.currentState?.goToSelectedWeek(newDate); // Используем ключ для доступа к состоянию 
  } 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      body: Stack( 
        children: [ 
          Column( 
            children: [ 
              SizedBox(height: MediaQuery.of(context).size.height * 0.02), 
              DateBuilder( 
                key: dateBuilderKey, // Устанавливаем ключ 
                onDateScrolled: onDateScrolled, 
                selectedDateAppBar: selectedDate, 
              ), 
              SizedBox(height: MediaQuery.of(context).size.height * 0.01), 
              const Line(), 
              SizedBox(height: MediaQuery.of(context).size.height * 0.02), 
              const Expanded(child: TaskListWidget()), 
            ], 
          ), 
          const Positioned( 
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