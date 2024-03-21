//новая версия(GPT)
import 'package:flutter/material.dart';
import 'package:multitask/text_style.dart';

DateTime now = DateTime.now();
List<int> weekNumbers = [];

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

var days = [
    'ПН',
    'ВТ',
    'СР',
    'ЧТ',
    'ПТ',
    'СБ',
    'ВС'
];


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {

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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        //padding: const EdgeInsets.only(top:40, left:40),
        title: Text(
          currentMonth(),
          style: headerTextStyle(),
          ),
        ),
        body: const ListViewBuilder()
        )
      );
    } 
  } 

String currentMonth() {
  int month = now.month;
  return  '${months[month - 1]} ${now.year}';
}

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: weekNumbers.length,
          itemBuilder: (context, index) {
          return DateOfWeek(text: weekNumbers[index].toString());
          }
    )
    );
  }
}


class DateOfWeek extends StatelessWidget {
  final String text;
  const DateOfWeek({required this.text});

  @override
  Widget build(BuildContext context) {
      return SizedBox(
          child: Align(
          alignment: Alignment.topCenter,
          child:  ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              //padding: const EdgeInsets.all(2),
              shape: const CircleBorder()
            ),
              child: Text(
                      text,
                      style: smallTextStyle(),
                      textAlign: TextAlign.center
          ),
        )
      ),
    );
  }
}

