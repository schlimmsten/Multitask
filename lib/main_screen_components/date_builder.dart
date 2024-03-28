import 'package:flutter/material.dart';
import 'date_of_week.dart';

//это надо будет передалать когда дело дойдет до листания дат
DateTime now = DateTime.now();

class DateBuilder extends StatefulWidget {
  const DateBuilder({super.key});

  @override
  State<DateBuilder> createState() => _DateBuilderState();
}

//нужен ли _selectedIndex

class _DateBuilderState extends State<DateBuilder> {

  List<DateOfWeek> weekNumbersButtons = List.filled(7, const DateOfWeek(text: "0", isSelected: false));
  int _selectedIndex = 0;

//куда то пихнуть initState, возможно обертка поможет

  @override
  void initState() {
    super.initState();
    _generateWeekNumbers();
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
      _generateWeekNumbers();
    });
  }


  void _generateWeekNumbers() {
    int currentDay = now.weekday;
    for (int i = 1; i <= 7; i++) {
      int dayDifference = i - currentDay;
      DateTime date = now.add(Duration(days: dayDifference));
      weekNumbersButtons[i - 1] = DateOfWeek(text: date.day.toString(), isSelected: i - 1 == _selectedIndex,);
    }
  }


  // https://stackoverflow.com/questions/51415556/flutter-listview-item-click-listener
  // доавить ListTile для обработки onTap и дальше возможно придется часть кода gpt с isSelected
  @override
  Widget build(BuildContext context) {
      return SizedBox(
        height: 65,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: weekNumbersButtons.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              //не срабатывает onTap
              onTap: (){
                debugPrint("is pressed");
                _onItemTapped(index);
              },
              child: weekNumbersButtons[index]
            );
          }
        )
      );
//       return SizedBox(
//   height: 65,
//   child: Row(
//     children: List.generate(weekNumbersButtons.length, (index) {
//       return GestureDetector(
//         onTap: () {
//           debugPrint("is pressed");
//           setState(() {
//             _selectedIndex = index;
//             _generateWeekNumbers();
//           });
//         },
//         child: weekNumbersButtons[index],
//       );
//     }),
//   ),
// );
    }
}