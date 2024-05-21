import 'package:flutter/material.dart';
import 'package:multitask/add_screen_components/data_task/task_model.dart';
import 'package:provider/provider.dart';
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
  const DateBuilder({Key? key}) : super(key: key);

  @override
  _DateBuilderState createState() => _DateBuilderState();
}

class _DateBuilderState extends State<DateBuilder> {
  late List<ValueNotifier<bool>> isSelectedList;

  @override
  void initState() {
    super.initState();
    isSelectedList = List.generate(7, (index) => ValueNotifier<bool>(false));
    // Устанавливаем значение true для сегодняшней даты
    DateTime now = DateTime.now();
    int todayIndex = now.weekday - 1;
    isSelectedList[todayIndex].value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(
      builder: (context, taskModel, _) {
        return SizedBox(
          height: 75,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            separatorBuilder: (BuildContext context, int index) =>
                VerticalDivider(
                  width: 2.5,
                  color: Theme.of(context).appBarTheme.backgroundColor,
                ),
            itemBuilder: (context, index) {
              return SizedBox(
                width: 54,
                child: ValueListenableBuilder<bool>(
                  valueListenable: isSelectedList[index],
                  builder: (context, isSelected, child) {
                    return DateOfWeek(
                      day: days[index],
                      date: (DateTime.now().add(Duration(days: index - DateTime.now().weekday + 1))).day.toString(),
                      isSelected: isSelected,
                      onPressed: () {
                        _onItemTapped(index, taskModel);
                      },
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _onItemTapped(int index, TaskModel taskModel) {
    setState(() {
      for (int i = 0; i < isSelectedList.length; i++) {
        isSelectedList[i].value = i == index;
      }
    });

    DateTime now = DateTime.now();
    int dayDifference = index - now.weekday + 1;
    DateTime date = now.add(Duration(days: dayDifference));
    taskModel.setSelectedDate(date);
  }
}
