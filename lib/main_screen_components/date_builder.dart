import 'package:flutter/material.dart';
import 'package:multitask/add_screen_components/data_task/task_model.dart';
import 'date_of_week.dart';
import 'package:provider/provider.dart';

var days = [
  'ПН',
  'ВТ',
  'СР',
  'ЧТ',
  'ПТ',
  'СБ',
  'ВС',
];

class DateBuilder extends StatefulWidget {
  final void Function(DateTime) onDateScrolled;
  final DateTime selectedDateAppBar;

  const DateBuilder({
    super.key,
    required this.onDateScrolled,
    required this.selectedDateAppBar,
  });

  @override
  DateBuilderState createState() => DateBuilderState();
}

class DateBuilderState extends State<DateBuilder> {
  late PageController _pageController;
  late DateTime selectedDate;
  late int currentPage;
  final List<ValueNotifier<bool>> isSelectedList =
      List.generate(7, (index) => ValueNotifier<bool>(false));
  bool isTapped = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 5000);
    currentPage = 5000;
    loadSelectedDate();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(
      builder: (context, taskModel, _) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.09,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
                _updateSelectedList(taskModel);
              });
              DateTime currentDate = _getCurrentDate();
              widget.onDateScrolled(currentDate);
            },
            itemCount: 10000,
            itemBuilder: (context, pageIndex) {
              DateTime startDate = DateTime.now()
                  .subtract(Duration(days: DateTime.now().weekday - 1))
                  .add(Duration(days: 7 * (pageIndex - 5000)));

              List<Widget> weekDays = List.generate(7, (dayIndex) {
                DateTime currentDate = startDate.add(Duration(days: dayIndex));
                return Expanded(
                  child: ValueListenableBuilder<bool>(
                    valueListenable: isSelectedList[dayIndex],
                    builder: (context, isSelected, child) {
                      return DateOfWeek(
                        day: days[dayIndex],
                        date: currentDate.day.toString(),
                        isSelected: isSelected,
                        onPressed: () {
                          _onItemTapped(dayIndex, currentDate, taskModel);
                        },
                      );
                    },
                  ),
                );
              });

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: weekDays,
              );
            },
          ),
        );
      },
    );
  }

  void _onItemTapped(int index, DateTime currentDate, TaskModel taskModel) {
    setState(() {
      for (int i = 0; i < isSelectedList.length; i++) {
        isSelectedList[i].value = false;
      }
      isSelectedList[index].value = true;
      isTapped = true;
    });

    selectedDate = currentDate;
    taskModel.setSelectedDate(selectedDate);
  }

  void loadSelectedDate() {
    selectedDate = DateTime.now();
    _updateSelectedList(Provider.of<TaskModel>(context, listen: false));
  }

  void _updateSelectedList(TaskModel taskModel) {
    DateTime startDate = DateTime.now()
        .subtract(Duration(days: DateTime.now().weekday - 1))
        .add(Duration(days: 7 * (currentPage - 5000)));
    for (int i = 0; i < 7; i++) {
      DateTime currentDate = startDate.add(Duration(days: i));
      if (currentDate.year == selectedDate.year &&
          currentDate.month == selectedDate.month &&
          currentDate.day == selectedDate.day) {
        isSelectedList[i].value = true;
      } else {
        isSelectedList[i].value = false;
      }
    }
    taskModel.setSelectedDate(selectedDate);
  }

  DateTime _getCurrentDate() {
    DateTime startDate = DateTime.now()
        .subtract(Duration(days: DateTime.now().weekday - 1))
        .add(Duration(days: 7 * (currentPage - 5000)));
    return startDate;
  }

  void goToSelectedWeek(DateTime selectedDate) {
    int targetPage = 5000 +
        ((selectedDate.difference(DateTime.now()).inDays + DateTime.now().weekday -1) ~/7);
    _pageController.jumpToPage(targetPage);
    setState(() {
      currentPage = targetPage;
      this.selectedDate = selectedDate;
      _updateSelectedList(Provider.of<TaskModel>(context, listen: false));
    });
    
  }
}
