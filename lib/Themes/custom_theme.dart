import 'package:flutter/material.dart';


class CustomTheme with ChangeNotifier {
  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;

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
    notifyListeners();
  }
}
