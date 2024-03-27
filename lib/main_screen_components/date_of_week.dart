import 'package:flutter/material.dart';
//import 'date_builder.dart';

class DateOfWeek extends StatefulWidget {
  final String text;

  const DateOfWeek({super.key, required this.text});

  //хули тварь ругается / реши потом
  @override
  State<DateOfWeek> createState() => _DateOfWeekState(text);
}

class _DateOfWeekState extends State<DateOfWeek> {

  late Color _buttonColor;
  final String text;

  _DateOfWeekState(this.text);

  @override
  void initState(){
    _buttonColor = Colors.black;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.only(left: 7),
    width: 55,
    child: TextButton(
      onPressed: () {
        setState(() {
          if (_buttonColor == Colors.black) {
            _buttonColor = Colors.blue.shade900;
          } else {
            _buttonColor = Colors.black;
          }
        });
      },
      style: TextButton.styleFrom(
        shape: const CircleBorder(),
        ),
      child: Text(
        text,
        style: TextStyle( 
          fontSize: 18,
          fontFamily: "Montserrat",
          color: _buttonColor),
        textAlign: TextAlign.center
        ),
      ),
    );
  }
}