//новая версия(GPT)
import 'package:flutter/material.dart';
import 'package:multitask/navigation_rail/nav_rail.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
      return const Scaffold(
        body: Navigation(),
      );
    } 
  } 
