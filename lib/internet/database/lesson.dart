import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'lesson.g.dart';

@HiveType(typeId: 3)
class Lesson {
  @HiveField(0)
  String dayTitle;

  @HiveField(1)
  int weekCode;

  @HiveField(2)
  String time;

  @HiveField(3)
  String discipline;

  @HiveField(4)
  String lecturer;

  @HiveField(5)
  String classroom;

  @HiveField(6)
  int? id;

  Lesson({
    required this.dayTitle,
    required this.weekCode,
    required this.time,
    required this.discipline,
    required this.lecturer,
    required this.classroom,
    this.id, 
  });

  @override
  String toString() {
    return 'День недели: $dayTitle \n Код недели: $weekCode \n Время пары: $time \n Пара: $discipline \n Преподователь: $lecturer \n Кабинет: $classroom';
  }
}
