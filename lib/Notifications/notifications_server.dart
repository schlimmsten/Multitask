import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class Notifications{
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  

  // Инициализация плагина
  static Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/launcher_icon');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            onDidReceiveLocalNotification: (id, title, body, payload) {});
    const LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {},
    );
    // Создание канала уведомлений
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'tiket_2', // ID канала
      'schedule_tiket', // Имя канала
      description: 'Channel for scheduled notifications', // Описание канала
      importance: Importance.max,
      playSound: true,
    );
    final platform =
        _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    // Создание канала на Android
    await platform?.createNotificationChannel(channel);
    // Запрос разрешений на iOS
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    // Инициализация временных зон
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
    _checkPendingNotificationRequests();
  }

  // Запланированное локальное уведомление
  static Future<void> scheduleNotification({
    required String title,
    required int id,
    required DateTime date,
  }) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'tiket_2', // ID канала должен совпадать с созданным каналом
      'schedule_tiket', // Имя канала
      channelDescription: 'Channel for scheduled notifications',
      importance: Importance.max,
      priority: Priority.max,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    var time = tz.TZDateTime.from(date, tz.local);
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        "Сделай $title и мир станет ярче",
        "Еще один шаг к успеху. Вперед!",
        time,
        platformChannelSpecifics,
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: '$time',
        matchDateTimeComponents: DateTimeComponents.time,
      );
    var time1hour =
        tz.TZDateTime.from(date, tz.local).subtract(const Duration(hours: 1));
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        id + 1,
        "До $title остался час",
        "Не забывай о поставленных задачах",
        time1hour,
        platformChannelSpecifics,
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: '$time1hour',
        matchDateTimeComponents: DateTimeComponents.time,
      );
      _checkPendingNotificationRequests();
  }

  // Удаление запланированного уведомления
  static Future<void> deleteNotification({required int id}) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
    _checkPendingNotificationRequests();
  }

  // Проверка на существование уведомления
  static Future<bool> isNotificationScheduled(int id) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    List<PendingNotificationRequest> pendingNotifications =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();

    for (PendingNotificationRequest notification in pendingNotifications) {
      if (notification.id == id) {
        return true;
      }
    }

    return false;
  }

  // Отладка уведомлений
  static Future<void> _checkPendingNotificationRequests() async {
    final List<PendingNotificationRequest> pendingNotificationRequests =
        await _flutterLocalNotificationsPlugin.pendingNotificationRequests();
    print('${pendingNotificationRequests.length} pending notification ');

    for (PendingNotificationRequest pendingNotificationRequest
        in pendingNotificationRequests) {
      print(
          '${pendingNotificationRequest.id} ${pendingNotificationRequest.payload ?? ""}');
    }
    print('NOW ${tz.TZDateTime.now(tz.local)}');
  }


  // Очистка всех уведомлений
  static Future<void> cancelAllNotifications() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
    _checkPendingNotificationRequests();
  }
}
