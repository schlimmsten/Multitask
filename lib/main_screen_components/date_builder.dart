// import 'package:flutter/material.dart';
// import 'package:multitask/add_screen_components/data_task/task_model.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'date_of_week.dart';

// List<String> days = [
//     'ПН',
//     'ВТ',
//     'СР',
//     'ЧТ',
//     'ПТ',
//     'СБ',
//     'ВС',
// ];

// class DateBuilder extends StatefulWidget {
//   const DateBuilder({Key? key}) : super(key: key);

//   @override
//   _DateBuilderState createState() => _DateBuilderState();
// }

// class _DateBuilderState extends State<DateBuilder> {
//   late List<ValueNotifier<bool>> isSelectedList;
//   late DateTime selectedDate;

//   @override
//   void initState() {
//     super.initState();
//     loadSelectedDate();
//     isSelectedList = List.generate(7, (index) => ValueNotifier<bool>(false));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<TaskMaodel>(
//       builder: (context, taskModel, _) {
//         return SizedBox(
//           height: MediQuery.of(context).size.height * 0.09,
//           child: ListView.separated(
//             scrollDirection: Axis.horizontal,
//             itemCount: 7,
//             separatorBuilder: (BuildContext context, int index) =>
//                 VerticalDivider(
//                   width: MediaQuery.of(context).size.width * 0.006,
//                   color: Theme.of(context).appBarTheme.backgroundColor,
//                 ),
//             itemBuilder: (context, index) {
//               return SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.1374,
//                 child: ValueListenableBuilder<bool>(
//                   valueListenable: isSelectedList[index],
//                   builder: (context, isSelected, child) {
//                     return DateOfWeek(
//                       day: days[index],
//                       date: (DateTime.now().add(Duration(days: index - DateTime.now().weekday + 1))).day.toString(),
//                       isSelected: isSelected,
//                       onPressed: () {
//                         _onItemTapped(index, taskModel);
//                       },
//                     );
//                   },
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }

//   void _onItemTapped(int index, TaskModel taskModel) {
//     setState(() {
//       for (int i = 0; i < isSelectedList.length; i++) {
//         isSelectedList[i].value = i == index;
//       }
//     });

//     DateTime now = DateTime.now();
//     int dayDifference = index - now.weekday + 1;
//     selectedDate = now.add(Duration(days: dayDifference));
//     saveSelectedDate(selectedDate);
//     taskModel.setSelectedDate(selectedDate);
//   }

//   Future<void> saveSelectedDate(DateTime date) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('selectedDate', date.toIso8601String());
//   }

//   Future<void> loadSelectedDate() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? dateString = prefs.getString('selectedDate');
//     if (dateString != null) {
//       selectedDate = DateTime.parse(dateString);
//       int selectedIndex = selectedDate.weekday - 1;
//       isSelectedList[selectedIndex].value = true;
//     } else {
//       selectedDate = DateTime.now();
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:multitask/add_screen_components/data_task/task_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  DateBuilderState createState() => DateBuilderState();
}

class DateBuilderState extends State<DateBuilder> {
  late PageController _pageController;
  late DateTime selectedDate;
  late int currentPage;
  final List<ValueNotifier<bool>> isSelectedList =
      List.generate(7, (index) => ValueNotifier<bool>(false));
  bool isTapped = false; // Добавим переменную для отслеживания тапов

  @override
  void initState() {
    super.initState();
    
    _pageController = PageController(
        initialPage: 5000); // Ставим начальную страницу в середину
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
            },
            itemCount:
                10000, // Достаточно большое число для бесконечной прокрутки
            itemBuilder: (context, pageIndex) {
              // Вычисляем начальную дату для текущей страницы
              DateTime startDate = DateTime.now()
                  .subtract(Duration(days: DateTime.now().weekday - 1))
                  .add(Duration(days: 7 * (pageIndex - 5000)));

              // Создаем список виджетов для текущей недели
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
      isTapped = true; // Устанавливаем флаг тапа
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
  }
}
