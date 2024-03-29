import 'package:flutter/material.dart';
import 'date_of_week.dart';

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
      text: date.day.toString(),
      isSelected: selected,
      onTap: () {
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weekNumbersButtons.length,
        itemBuilder: (context, index) {
          return weekNumbersButtons[index];
        },
      ),
    );
  }
}