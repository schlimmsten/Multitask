import 'package:flutter/material.dart';
import 'date_of_week.dart';

//это надо будет передалать когда дело дойдет до листания дат
List<DateOfWeek> weekNumbersButtons = List.filled(7, const DateOfWeek(text: "0"));
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
      weekNumbersButtons[i - 1] = DateOfWeek(text: date.day.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
      return SizedBox(
        height: 65,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: weekNumbersButtons.length,
          itemBuilder: (context, index) {
            return weekNumbersButtons[index];
          }
        )
      );
    }
}