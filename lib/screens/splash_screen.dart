import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multitask/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:multitask/themes/custom_theme.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> 
    with SingleTickerProviderStateMixin {
      //убирает хуйню сверху и снизу
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const HomeScreen()
        ));
    });
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
      //backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(Provider.of<CustomTheme>(context).isDarkTheme? 'images/logo_white.png' : 'images/logo_blue.png')
      )
    );
  }
}