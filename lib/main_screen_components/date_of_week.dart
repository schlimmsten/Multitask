import 'package:flutter/material.dart';

class DateOfWeek extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const DateOfWeek({super.key,required this.text,required this.isSelected,required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(  
          shape: const CircleBorder(),  
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontFamily: "Montserrat",
          color: isSelected ? const Color.fromARGB(255, 8, 4, 252) : Theme.of(context).textTheme.displayLarge?.color ?? Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  DateOfWeek copyWith({
    String? text,
    bool? isSelected,
    VoidCallback? onPressed,
  }) {
    return DateOfWeek(
      text: text ?? this.text,
      isSelected: isSelected ?? this.isSelected,
      onPressed: onPressed ?? this.onPressed,
    );
  }
}