import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'lesson.dart';

class LessonRead extends ChangeNotifier {
  final _lessons = <Lesson>[];

  List<Lesson> get lessons => _lessons.toList();

  LessonRead() {
    setup();
  }

 void _readLessonsFromHive(Box<Lesson> box) {
    for (var key in box.keys) {
      var lesson = box.get(key)!;
      lesson.id = key;
      //возможно нужен будет id
      _lessons.add(lesson);
      }
  notifyListeners();
}

  void setup() async {
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(LessonAdapter());
    }
    final box = await Hive.openBox<Lesson>('lesson_box');
    _readLessonsFromHive(box);
    box.listenable().addListener(() => _readLessonsFromHive(box));
  }

}

//???
class LessonReadProvider extends InheritedNotifier {
  final LessonRead model;
  const LessonReadProvider(
      {super.key, required super.child, required this.model})
      : super(notifier: model);

  static LessonReadProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LessonReadProvider>();
  }
}
