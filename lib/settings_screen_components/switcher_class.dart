import 'package:flutter/material.dart';
import 'package:multitask/settings_screen_components/settings_switcher.dart';
import '../text_style.dart';

class SettingsRow extends StatelessWidget {
  final String title;
  final bool initialValue;
  final Function(bool) onChanged;

  const SettingsRow({
    super.key,
    required this.title,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            title,
            style: settingsTextStyle(
                context), // Предполагается, что у вас есть этот стиль
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Switcher(
            initialValue: initialValue,
            onChanged: onChanged,
          ),
        )
      ],
    );
  }
}
