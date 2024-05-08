import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class CustomTheme with ChangeNotifier {
  static const isDarkKey = 'key';
  bool _isDarkTheme = false;


    CustomTheme() {
    // Вызываем метод для восстановления темы при запуске приложения
    _getDarkTheme().then((value) {
      _isDarkTheme = value;
      notifyListeners();
    });
  }

  bool get isDarkTheme => _isDarkTheme;

  Future<void> _setDarkTheme() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isDarkKey, _isDarkTheme);
    notifyListeners();
  }

  Future<bool> _getDarkTheme() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isDarkKey) ?? false;
  }

 
  ThemeData get currentTheme => _isDarkTheme ? darkTheme : lightTheme;
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Montserrat',
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black),
      ),
      primaryColor: const Color.fromARGB(255, 78, 153, 240),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.grey[800],
      fontFamily: 'Montserrat',
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[800],
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      primaryColor: Colors.white,
      textTheme: ThemeData.dark().textTheme,
    );
  }

  void toggleTheme(bool isDark) {
    _isDarkTheme = isDark;// Сохраняем выбранную тему
    _setDarkTheme();
  }
}
