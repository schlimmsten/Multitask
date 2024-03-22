import 'package:flutter/material.dart';
import 'package:multitask/text_style.dart';


DateTime now = DateTime.now();

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  List<int> weekNumbers = [];
  

  @override
  void initState() {
    super.initState();
    _generateWeekNumbers();
  }

  void _generateWeekNumbers() {
    int currentDay = now.weekday;
    for (int i = 1; i <= 7; i++) {
      int dayDifference = i - currentDay;
      DateTime date = now.add(Duration(days: dayDifference));
      weekNumbers.add(date.day);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: 
      body: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Обработка нажатия на пункт меню
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Обработка нажатия на пункт меню
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

String currentMonth() {
  int month = now.month;
  var months = [
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь'
  ];
  return months[month - 1];
}

class DateOfWeek extends StatelessWidget {
  final String text;
  const DateOfWeek({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(5),
        ),
        child: Text(text),
      ),
    );
  }
}
