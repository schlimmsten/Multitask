import 'package:flutter/material.dart';

class Switcher extends StatefulWidget {
  final bool initialValue;
  final Function(bool) onChanged;
  const Switcher({super.key, required this.initialValue, required this.onChanged});

  @override
  // ignore: library_private_types_in_public_api
  _SwitcherState createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  late bool _switchValue; // переменная состояния для хранения текущего значения тумблера

  @override
  void initState() {
    super.initState();
    _switchValue = widget.initialValue; // инициализация текущего значения тумблера
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _switchValue,
      onChanged: (value) {
        setState(() {
          _switchValue = value;// обновление текущего значения тумблера при изменении его состояния
        });
        widget.onChanged(value);// вызов функции обратного вызова с новым значением
      },
      activeColor: Theme.of(context).primaryColor, // Цвет включенного состояния
      inactiveTrackColor: Theme.of(context).primaryColor.withOpacity(0.1),
      inactiveThumbColor: Theme.of(context).primaryColor.withOpacity(0.5)
    );
  }
}
