import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'task.g.dart';

@HiveType(typeId: 1)
class Task{
  @HiveField(0)
  String name;

  @HiveField(1)
  String description;

  @HiveField(2)
  String selectedDay;

  @HiveField(3)
  String selectedMonth;

  @HiveField(4)
  String selectedYear;

  @HiveField(5)
  String selectedTime;

  @HiveField(6)
  String category;

  @HiveField(7)
  Color? color;
  Task({
    required this.name,
    required this.description,
    required this.selectedDay,
    required this.selectedMonth,
    required this.selectedTime,
    required this.selectedYear,
    required this.category,
    required this.color,
  });
}