import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'lesson.dart';

class LessonRead extends ChangeNotifier {
  final List<Lesson> _lessonsMon = [];
  final List<Lesson> _lessonsTue = [];
  final List<Lesson> _lessonsWed = [];
  final List<Lesson> _lessonsThu = [];
  final List<Lesson> _lessonsFri = [];
  final List<Lesson> _lessonsSat = [];
  final List<Lesson> _lessonsSun = [];

  List<Lesson> get lessonsMon => _lessonsMon.toList();
  List<Lesson> get lessonsTue => _lessonsTue.toList();
  List<Lesson> get lessonsWed => _lessonsWed.toList();
  List<Lesson> get lessonsThu => _lessonsThu.toList();
  List<Lesson> get lessonsFri => _lessonsFri.toList();
  List<Lesson> get lessonsSat => _lessonsSat.toList();
  List<Lesson> get lessonsSun => _lessonsSun.toList();

  LessonRead() {
    setup();
  }

  void _readLessonsFromHive(Box<Lesson> box) {
    _clearLessons();
    for (var key in box.keys) {
      var lesson = box.get(key)!;
      lesson.id = key;
      _addLesson(lesson);
    }
    notifyListeners();
  }

  void _clearLessons() {
    _lessonsMon.clear();
    _lessonsTue.clear();
    _lessonsWed.clear();
    _lessonsThu.clear();
    _lessonsFri.clear();
    _lessonsSat.clear();
    _lessonsSun.clear();
  }

  void _addLesson(Lesson lesson) {
    switch (lesson.dayTitle) {
      case "Понедельник":
        _lessonsMon.add(lesson);
        break;
      case "Вторник":
        _lessonsTue.add(lesson);
        break;
      case "Среда":
        _lessonsWed.add(lesson);
        break;
      case "Четверг":
        _lessonsThu.add(lesson);
        break;
      case "Пятница":
        _lessonsFri.add(lesson);
        break;
      case "Суббота":
        _lessonsSat.add(lesson);
        break;
      case "Воскресенье":
        _lessonsSun.add(lesson);
        break;
    }
  }

  Future<void> setup() async {
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(LessonAdapter());
    }
    final box = await Hive.openBox<Lesson>('lesson_box');
    _readLessonsFromHive(box);
    box.listenable().addListener(() => _readLessonsFromHive(box));
  }
  void _deleteItemBox(Lesson task, final box) async {
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(LessonAdapter());
    }
    await box.delete(task.id);
  }
  Future<void> fetchLessonsForGroup() async {
    _clearLessons();
    final box = await Hive.openBox<Lesson>('lesson_box');
    for (var key in box.keys) {
      var lesson = box.get(key)!;
      lesson.id = key;
      _deleteItemBox(lesson, box);
    }
    notifyListeners();
  }
}
