import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multitask/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:multitask/themes/custom_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:multitask/screens/main_screen.dart'; // Добавьте импорт экрана, который должен отображаться после первого запуска

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> 
    with SingleTickerProviderStateMixin {
  
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

    // Задержка перед переходом на следующий экран
    await Future.delayed(const Duration(seconds: 3));

    if (isFirstLaunch) {
      // Сохранение состояния первого запуска
      await prefs.setBool('isFirstLaunch', false);
      // Переход на экран HomeScreen
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const HomeScreen()
      ));
    } else {
      // Переход на основной экран приложения
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const MainScreen() // Замените на ваш основной экран
      ));
    }
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, 
      overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(Provider.of<CustomTheme>(context).isDarkTheme
          ? 'images/logo_white.png' : 'images/logo_blue.png'
        )
      )
    );
  }
}