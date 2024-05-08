import 'package:flutter/material.dart';

/*
class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State
{
  
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        _selectedDate != null && _selectedTime != null
            ? 'Дата: ${_selectedDate!.toString().split(' ')[0]}, Время: ${_selectedTime!.format(context)}'
            : "Выбрать дату и время выполнения",
        style: TextStyle(
          fontSize: 18,
          fontFamily: "Montserrat",
          color: Colors.black,
        ),
      ),
      onPressed: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2050),
        ).then((selectedDate) {
          if (selectedDate != null) {
            setState(() {
              _selectedDate = selectedDate;
            });
            showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            ).then((selectedTime) {
              if (selectedTime != null) {
                setState(() {
                  _selectedTime = selectedTime;
                });
                DateTime? combinedDateTime = DateTime(
                  _selectedDate!.year,
                  _selectedDate!.month,
                  _selectedDate!.day,
                  _selectedTime!.hour,
                  _selectedTime!.minute,
                );
              }
            });
          }
        });
      },
    );
  }
}
*/
/*
class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State
{
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        _selectedDate != null && _selectedTime != null
            ? 'Дата: ${_selectedDate!.toString().split(' ')[0]}, Время: ${_selectedTime!.format(context)}'
            : "Выбрать дату и время выполнения",
        style: TextStyle(
          fontSize: 18,
          fontFamily: "Montserrat",
          color: Colors.black,
        ),
      ),
      onPressed: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2050),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                primaryColor: const Color.fromARGB(255, 78, 153, 240),
                colorScheme: const ColorScheme.light(
                  primary: Color.fromARGB(
                      255, 78, 153, 240), // header background color
                  onPrimary: Colors.white, // header text color
                  onSurface: Colors.black, // body text color
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(
                        255, 78, 153, 240), // button text color
                  ),
                ),
              ),
              child: child!,
            );
          },
        ).then((selectedDate) {
          if (selectedDate != null) {
            setState(() {
              _selectedDate = selectedDate;
            });
            showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            ).then((selectedTime) {
              if (selectedTime != null) {
                setState(() {
                  _selectedTime = selectedTime;
                });
              }
            });
          }
        });
      },
    );
  }
}
*/
/* rabota
class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();

  DateTime? getSelectedDateTime() {
    // Получаем доступ к состоянию _DatePickerState
    final state = _DatePickerState();
    // Возвращаем результат вызова метода из состояния
    return state.getSelectedDateTime();
  }
}

class _DatePickerState extends State<DatePicker> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2050),
        ).then((selectedDate) {
          if (selectedDate != null) {
            setState(() {
              _selectedDate = selectedDate;
            });
            showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            ).then((selectedTime) {
              if (selectedTime != null) {
                setState(() {
                  _selectedTime = selectedTime;
                });
              }
            });
          }
        });
      },
      child: Text(
        _selectedDate != null && _selectedTime != null
            ? 'Дата: ${_selectedDate!.toString().split(' ')[0]}, Время: ${_selectedTime!.format(context)}'
            : "Выбрать дату и время выполнения",
        style: TextStyle(
          fontSize: 18,
          fontFamily: "Montserrat",
          color: Colors.black,
        ),
      ),
    );
  }

  DateTime? getSelectedDateTime() {
    if (_selectedDate != null && _selectedTime != null) {
      return DateTime(
        _selectedDate!.year,
        _selectedDate!.month,
        _selectedDate!.day,
        _selectedTime!.hour,
        _selectedTime!.minute,
      );
    } else {
      return null;
    }
  }
}
*/
class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();

  DateTime? getSelectedDateTime() {
    final state = _DatePickerState();
    return state.getSelectedDateTime();
  }
}

class _DatePickerState extends State<DatePicker> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2050),
        ).then((selectedDate) {
          if (selectedDate != null) {
            setState(() {
              _selectedDate = selectedDate;
            });
            showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            ).then((selectedTime) {
              if (selectedTime != null) {
                setState(() {
                  _selectedTime = selectedTime;
                });
              }
            });
          }
        });
      },
      child: Text(
        _selectedDate != null && _selectedTime != null
            ? 'Дата: ${_selectedDate!.toString().split(' ')[0]}, Время: ${_selectedTime!.format(context)}'
            : "Выбрать дату и время выполнения",
        style: TextStyle(
          fontSize: 18,
          fontFamily: "Montserrat",
          color: Colors.black,
        ),
      ),
    );
  }

  DateTime? getSelectedDateTime() {
    if (_selectedDate != null && _selectedTime != null) {
      return DateTime(
        _selectedDate!.year,
        _selectedDate!.month,
        _selectedDate!.day,
        _selectedTime!.hour,
        _selectedTime!.minute,
      );
    } else {
      return null;
    }
  }
}