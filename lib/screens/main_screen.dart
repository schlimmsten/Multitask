//import 'package:flutter/material.dart';
//import 'package:multitask/text_style.dart';

// DateTime now = DateTime.now();
//  void zxc(){
//   int currentDay = now.weekday;
//   for(int i = 1; i <= 7; i++){
//   int dayDifference = i - currentDay;
//   DateTime date = now.add(Duration(days: dayDifference));
//                 weekNumbers
//                 }
//  }
// //переделать в StatefulWidget
// class MainScreen extends StatelessWidget {

//   const MainScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.only(top: 40, left: 40, bottom: 20),
//         child: Column(
//           children: [
//           Text(currentMonth(),
//             style: headerTextStyle(),
//           ),
//           const Row(
//             children: [
//             ],
//           ),
//           ]
//         )
//         )
//       );
//   }
// }
   
// String currentMonth()
// {
//   int month = now.month;
//   var months = 
//   ['Январь',
//   'Февраль',
//   'Март',
//   'Апрель',
//   'Май',
//   'Июнь',
//   'Июль',
//   'Август',
//   'Сентябрь',
//   'Октябрь',
//   'Ноябрь',
//   'Декабрь'];
//   return months[month-1];
// }


// class DateOfWeek extends StatelessWidget {
//   final String text;
//   const DateOfWeek({required this.text});
//   //const DateOfWeek({super.key});
//   @override
//   Widget build(BuildContext context) {
//     //datesOfWeek();
//     return ElevatedButton(
//     onPressed: () {},
//     style: ElevatedButton.styleFrom(
//         shape: const CircleBorder(),
//         padding: const EdgeInsets.all(7),
//     ),
//     child: Text(text),
// );
//   }
// //   void datesOfWeek(){
// //    DateTime monday = now.subtract(Duration(days: now.weekday - 1));
// //     for (int i = 0; i < 7; i++) {
// //       listOfDates.add(const DateOfWeek());
// //       m
// //     }
// // }

  
// }
// //import 'package:flutter/material.dart';

// //   List<int> weekNumbers = [];

// //   DateTime now = DateTime.now();
// //   int currentDayOfWeek = now.weekday;

// //   for (int i = 1; i <= 7; i++) {
// //     int dayDifference = i - currentDayOfWeek;
// //     DateTime date = now.add(Duration(days: dayDifference));
// //     weekNumbers.add(date.day);
// //   }

// //   runApp(MaterialApp(
// //     home: Scaffold(
// //       appBar: AppBar(
// //         title: Text('Numbers of the Week'),
// //       ),
// //       body: Center(
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //           children: weekNumbers.map((number) {
// //             return CircleButton(text: number.toString());
// //           }).toList(),
// //         ),
// //       ),
// //     ),
// //   ));
// // }

// // class CircleButton extends StatelessWidget {
// //   final String text;

// //   CircleButton({required this.text});

// //   @override
// //   Widget build(BuildContext context) {
// //     return ElevatedButton(
// //       onPressed: () {},
// //       child: Text(text),
// //       style: ElevatedButton.styleFrom(
// //         shape: CircleBorder(),
// //         padding: EdgeInsets.all(16),
// //       ),
// //     );
// //   }
// // }
import 'package:flutter/material.dart';
import 'package:multitask/text_style.dart';

DateTime now = DateTime.now();

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  List<int> weekNumbers = [];

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:40, left:40),
            child: Text(
              currentMonth(),
              style: headerTextStyle(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: weekNumbers.length,
              itemBuilder: (context, index) {
                return DateOfWeek(text: weekNumbers[index].toString());
              },
            ),
          ),
        ],
      ),
    );
  }
}

String currentMonth() {
  int month = now.month;
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
  return months[month - 1];
}

class DateOfWeek extends StatelessWidget {
  final String text;
  const DateOfWeek({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(5),
        ),
        child: Text(text),
      ),
    );
  }
}
