import 'package:flutter/material.dart';
import 'package:multitask/text_style.dart';

List<int> weekNumbers = [];
DateTime now = DateTime.now();

class DateBuilder extends StatefulWidget {
  const DateBuilder({super.key});

  @override
  State<DateBuilder> createState() => _DateBuilderState();
}

class _DateBuilderState extends State<DateBuilder> {

//куда то пихнуть initState, возможно обертка поможет

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
      return SizedBox(
        height: 65,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: weekNumbers.length,
          itemBuilder: (context, index) {
            return DateOfWeek(text: weekNumbers[index].toString());
          }
        )
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