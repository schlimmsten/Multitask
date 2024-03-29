import 'package:flutter/material.dart';

class CustomTheme with ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  ThemeData get currentTheme => _isDarkTheme ? darkTheme : lightTheme;

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Montserrat',
      primaryColor: Colors.blue.shade900,
      iconTheme: const IconThemeData(color: Colors.white)
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
      iconTheme: IconThemeData(color: Colors.grey[800]),
      
    );
  }

  void toggleTheme(bool isDark) {
    _isDarkTheme = isDark;
    notifyListeners();
  }
}
