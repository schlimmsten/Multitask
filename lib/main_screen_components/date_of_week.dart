import 'package:flutter/material.dart';
import '../themes/custom_theme.dart';
import 'package:provider/provider.dart';

class DateOfWeek extends StatelessWidget {
  final String day;
  final String date;
  final bool isSelected;
  final VoidCallback onPressed;

  const DateOfWeek({
    super.key,
    required this.date,
    required this.day,
    required this.isSelected,
    required this.onPressed,
  });

//BorderSide(color: isSelected ? const Color.fromARGB(255, 8, 4, 252) : Theme.of(context).textTheme.displayLarge?.color ?? Colors.black,)

//тут с темами разобраться!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          
          backgroundColor: MaterialStateProperty.all<Color?>(isSelected
              ? Provider.of<CustomTheme>(context).isDarkTheme
                      ? Colors.white
                      : const Color.fromARGB(255, 78, 153, 240)
              : Theme.of(context).tabBarTheme.labelColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            //side: isSelected ? const BorderSide(color: Color.fromARGB(255, 8, 4, 252)) : BorderSide.none
          ))),
      child: Text(
        "$day\n$date",
        style: TextStyle(
          fontSize: 18,
          fontFamily: "Montserrat",
          color: ((day == 'СБ' || day == 'ВС') && !isSelected)
              ? Colors.red
              : (isSelected
                  ? Provider.of<CustomTheme>(context).isDarkTheme
                      ? Colors.grey[800]
                      : Colors.white
                  : Provider.of<CustomTheme>(context).isDarkTheme
                      ? Colors.white
                      : Colors.black),
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  DateOfWeek copyWith({
    String? day,
    String? date,
    bool? isSelected,
    VoidCallback? onPressed,
  }) {
    return DateOfWeek(
      day: day ?? this.day,
      date: date ?? this.date,
      isSelected: isSelected ?? this.isSelected,
      onPressed: onPressed ?? this.onPressed,
    );
  }
}
