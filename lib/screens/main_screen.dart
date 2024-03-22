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
      return Scaffold(
        //backgroundColor: Colors.black,
        appBar: AppBar(
        //padding: const EdgeInsets.only(top:40, left:40),
          title: Text(
            currentMonth(),
            style: headerTextStyle(),
            ),
          ),
        body: const SizedBox(
          height: 85,
          child: ListViewBuilder(),
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
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weekNumbers.length,
        itemBuilder: (context, index) {
          return DateOfWeek(text: weekNumbers[index].toString());
        }
      );
    }
  }

//ошибка сидит тут

class DateOfWeek extends StatefulWidget {
  final String text;

  const DateOfWeek({super.key, required this.text});

  //хули тварь ругается / реши потом
  @override
  State<DateOfWeek> createState() => _DateOfWeekState(text);
}

class _DateOfWeekState extends State<DateOfWeek> {

  final String text;

  _DateOfWeekState(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.only(left: 7),
    width: 55,
    child: TextButton(
      onPressed: () {
        setState(() {
          //меняем цвет
        });
      },
      style: TextButton.styleFrom(
        shape: const CircleBorder()
        ),
      child: Text(
        text,
        style: smallTextStyle(),
        textAlign: TextAlign.center
        ),
      ),
    );
  }
}

// FloatingActionButton(
//   onPressed: () {
//     // Делаем что-то при нажатии кнопки.
//   },
//   child: Icon(Icons.add),
//   backgroundColor: Colors.blue,
// )