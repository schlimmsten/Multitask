import 'package:flutter/material.dart';

class DateOfWeek extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const DateOfWeek({super.key,required this.text,required this.isSelected,required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 7),
        width: 55,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Montserrat",
            color: isSelected ? Colors.blue.shade900 : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  DateOfWeek copyWith({
    String? text,
    bool? isSelected,
    VoidCallback? onTap,
  }) {
    return DateOfWeek(
      text: text ?? this.text,
      isSelected: isSelected ?? this.isSelected,
      onTap: onTap ?? this.onTap,
    );
  }
}