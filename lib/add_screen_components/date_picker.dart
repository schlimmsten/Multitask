import 'package:flutter/material.dart';
import 'package:multitask/add_screen_components/data_task/task_form_model.dart';

class DatePicker extends StatefulWidget {
  final TaskFormModel model; // Передайте модель снаружи
  const DatePicker({required this.model, super.key});

  @override
  DatePickerState createState() => DatePickerState();
}

class DatePickerState extends State<DatePicker> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  void setSelectedDate(DateTime selectedDate) {
  setState(() {
    _selectedDate = selectedDate;
    widget.model.selectedDay = selectedDate.day.toString();
    widget.model.selecyedMonth = selectedDate.month.toString();
    widget.model.selectedYear = selectedDate.year.toString();
  });
}

void setSelectedTime(TimeOfDay selectedTime) {
  setState(() {
    _selectedTime = selectedTime;
    // Форматирование времени в 24-часовом формате
    final hour = selectedTime.hour.toString().padLeft(2, '0');
    final minute = selectedTime.minute.toString().padLeft(2, '0');
    widget.model.selectedTime = '$hour:$minute'; // Сохранение времени в 24-часовом формате
  });
}


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
            setSelectedDate(selectedDate); // Обновляем выбранную дату
            showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
              builder: (context, child) {
                return Theme(
                  data: ThemeData.light().copyWith(
                    colorScheme: const ColorScheme.light(
                      // change the border color
                      primary: Color.fromARGB(255, 78, 153, 240),
                      // change the text color
                      onSurface: Colors.black,
                    ),
                    timePickerTheme: const TimePickerThemeData(
                      // Настройка цвета фона кнопок "AM" и "PM"
                      dayPeriodColor: Color.fromARGB(255, 78, 153, 240),
                    ),
                  ),
                  child: child!,
                );
              },
            ).then((selectedTime) {
              if (selectedTime != null) {
                setSelectedTime(selectedTime); // Обновляем выбранное время
              }
            });
          }
        });
      },
      child: Text(
        _selectedDate != null && _selectedTime != null
            ? 'Дата: ${_selectedDate!.toString().split(' ')[0]}, Время: ${_selectedTime!.format(context)}'
            : "Выбрать дату и время выполнения",
        style: const TextStyle(
          fontSize: 18,
          fontFamily: "Montserrat",
          color: Colors.black,
        ),
      ),
    );
  }
}
