import 'package:flutter/material.dart';
import 'package:multitask/main_screen_components/main_screen_builder.dart';
import 'package:multitask/text_style.dart';
import 'package:multitask/main_screen_components/date_builder.dart';

var months = [
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь'
  ];

  //DateTime now = DateTime.now();

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _screenOptions = <Widget>[
    //первый вызов
    MainScreenBuilder(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //эта штука вызывается в body, а сами экраны должны быть в ней, она основной компонент

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //это должно менять на тап (в зависимости от окна)
      appBar: AppBar(
        title: Text(
          currentMonthAndYear(),
          style: headerTextStyle(),
          )
        ),
      //надо оборачивать виджеты в экран и вызывать просто экран(но он типа класс/виджет)
      body: _screenOptions[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 35, 31, 240),
              ),
              child: Text(
                'Multitask',
                style: headerTextStyle(),
                ),
            ),
            ListTile(
              title: const Text('Главное меню'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Расписание'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Настройки'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

String currentMonthAndYear() {
  int month = now.month;
  return  '${months[month - 1]} ${now.year}';
}
