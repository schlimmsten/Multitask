import 'package:flutter/material.dart';
import '../text_style.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        "Выбрать дату и время выполнения",
        style: smallalwaysblackTextStyle(context),
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
                }).then((selectedTime) {
              if (selectedTime != null) {}
            });
          }
        });
      },
    );
  }
}
