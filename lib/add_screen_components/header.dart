import 'package:flutter/material.dart';
import '../text_style.dart';
import 'package:multitask/settings_screen_components/line.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Text(
            "Добавление задачи",
            textAlign: TextAlign.center,
            style: headerTextStyle(context),
          ),
          const SizedBox(height: 10),
          const Line(),
        ],
    );
  }
}

