import 'package:flutter/material.dart';
import 'package:multitask/Notifications/notif_saver.dart';
import 'package:multitask/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:multitask/themes/custom_theme.dart';



class MultitaskApp extends StatelessWidget {
  const MultitaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    final notiSaverProvider = Provider.of<NotiSaver>(context, listen: false);

    return FutureBuilder(
      future: notiSaverProvider.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Center(child: Text("Error initializing notifications"));
        } else {
          return MaterialApp(
            theme: Provider.of<CustomTheme>(context).currentTheme,
            home: const SplashScreen(),
          );
        }
      },
    );
  }
  }
