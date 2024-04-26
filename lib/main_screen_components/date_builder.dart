import 'package:flutter/material.dart';
import 'date_of_week.dart';

List<String> days = [
    'ПН',
    'ВТ',
    'СР',
    'ЧТ',
    'ПТ',
    'СБ',
    'ВС',
];

class DateBuilder extends StatefulWidget {
  const DateBuilder({super.key});

  @override
  State<DateBuilder> createState() => _DateBuilderState();
}

class _DateBuilderState extends State<DateBuilder> {
  late List<DateOfWeek> weekNumbersButtons;

  @override
  void initState() {
    super.initState();
    weekNumbersButtons = List.generate(7, (index) => _buildDateOfWeek(index));
  }

  DateOfWeek _buildDateOfWeek(int index) {
    DateTime now = DateTime.now();
    int dayDifference = index - now.weekday + 1;
    DateTime date = now.add(Duration(days: dayDifference));
    bool selected = index == now.weekday - 1;
    return DateOfWeek(
      day: days[index],
      date: date.day.toString(),
      isSelected: selected,
      onPressed: () {
        _onItemTapped(index);
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      for (int i = 0; i < weekNumbersButtons.length; i++) {
        weekNumbersButtons[i] = weekNumbersButtons[i].copyWith(isSelected: i == index);
      }
    });
  }

  //вот тут будет сложно оптимизировать, надо как то более адекватно это сделать +
  //вопрос с листанием остается
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: weekNumbersButtons.length,
        separatorBuilder: (BuildContext context, int index) =>
                 VerticalDivider(width: 2.5, color: Theme.of(context).appBarTheme.backgroundColor,),
        itemBuilder: (context, index) {
          //можно сделать лучше?
          return SizedBox(  
            //padding: const EdgeInsets.only(left: 7, top: 4),  
            width: 54,
            child: weekNumbersButtons[index]
          );
        },
      ),
    );
  }
}