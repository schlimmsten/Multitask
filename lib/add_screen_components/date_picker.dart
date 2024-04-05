import 'package:flutter/material.dart';
import '../text_style.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({super.key});

  @override
Widget build(BuildContext context) {
  return ElevatedButton(

    child: Text(
      "Выбрать дату и время выполнения",
      style: smallTextStyle(),
    ),
    
    onPressed: () {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2050),
      ).then((selectedDate) {
        if (selectedDate != null) {
          showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          ).then((selectedTime) {
            if (selectedTime != null) {
            }
          });
        }
      });
    },
  );
}
}