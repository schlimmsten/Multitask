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
    
      _selectedIndex = index;
      _generateWeekNumbers();
    
  }

  //правильно работает 
  void _generateWeekNumbers() {
    int currentDay = now.weekday;
    for (int i = 1; i <= 7; i++) {
      int dayDifference = i - currentDay;
      DateTime date = now.add(Duration(days: dayDifference));
      bool selected = i - 1 == _selectedIndex;
      debugPrint("$selected");
      weekNumbersButtons[i - 1] = DateOfWeek(text: date.day.toString(), isSelected: selected,);
    }
  }


  // https://stackoverflow.com/questions/51415556/flutter-listview-item-click-listener
  // доавить ListTile для обработки onTap и дальше возможно придется часть кода gpt с isSelected
  @override
  Widget build(BuildContext context) {
      return SizedBox(
        height: 32,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: weekNumbersButtons.length,
          itemBuilder: (context, index) {
            //индексы тапнутого выдаются корректно !!! ГДЕ ОШИБКА
            //тут срабатывает нажатие, сделать что нибудь с размерностью? + добавить анимации
            //расчленение, переделать почти все
            return Container(
              padding: const EdgeInsets.only(top: 7),
              width: 55,
              height: 25,
              child: GestureDetector(
                //не срабатывает onTap
                onTap: (){
                  _onItemTapped(index);
                  debugPrint("is pressed");
                  debugPrint("Chosen one $_selectedIndex");
                },
                child: weekNumbersButtons[index]
                )
              );
            }
          )
        );
      }
}