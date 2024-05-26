import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multitask/add_screen_components/data_task/task.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './notifications_server.dart';

class NotiSaver with ChangeNotifier {
  static const isNotiKey = 'notikey';
  bool _isNotiOn = true;

  NotiSaver() {
    initialize();
  }

  Future<void> initialize() async {
    _isNotiOn = await _getNoti();
    notifyListeners();
  }

  bool get isNoti => _isNotiOn;

  Future<void> _setNoti() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isNotiKey, _isNotiOn);
    notifyListeners();
  }

  Future<bool> _getNoti() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isNotiKey) ?? _isNotiOn;
  }

  Future<void> toggleNoti(bool isNotif) async {
    _isNotiOn = isNotif;
    await _setNoti();
    
    if (!_isNotiOn) {
      Notifications.cancelAllNotifications();
    } else {
      if (!Hive.isAdapterRegistered(1)) {
        Hive.registerAdapter(TaskAdapter());
      }
      if (!Hive.isAdapterRegistered(2)) {
        Hive.registerAdapter(ColorAdapter());
      }

      final box = await Hive.openBox<Task>('tasks_box');
      _readTasksFromHive(box);
      box.listenable().addListener(() => _readTasksFromHive(box));
    }
    notifyListeners();
  }

  void _readTasksFromHive(Box<Task> box) {
    for (var key in box.keys) {
      var task = box.get(key)!;
      task.id = key; // Установите id задачи
      if (task.time?.year == DateTime.now().year &&
          task.time?.month == DateTime.now().month &&
          task.time?.day == DateTime.now().day) {
        if (!task.isSelected) {
          Notifications.scheduleNotification(
              title: task.name, id: task.id! * 1000, date: task.time!);
        }
      }
    }
    notifyListeners();
  }
}
