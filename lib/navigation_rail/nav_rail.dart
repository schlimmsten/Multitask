import 'package:flutter/material.dart';
import 'package:multitask/main_screen_components/main_screen_builder.dart';
import 'package:multitask/text_style.dart';
import '../screens/settings_screen.dart';

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

String currentMonthAndYear() {
  DateTime now = DateTime.now();
  int month = now.month;
  return '${months[month - 1]} ${now.year}';
}
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

  late List<String> _appBarOptions;

  @override
  void initState() {
    super.initState();
    _updateAppBarOptions();
  }

  void _updateAppBarOptions() {
    _appBarOptions = [
      currentMonthAndYear(),
      "Расписание",
      "Настройки"
    ];
  }

  static const List<Widget> _screenOptions = <Widget>[
    MainScreenBuilder(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //можно доработать добавив leading?

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _appBarOptions[_selectedIndex],
          style: headerTextStyle(),
        ),
      ),
      body: _screenOptions[_selectedIndex],
      drawer: Drawer(
        width: 220,
        backgroundColor: const Color.fromARGB(255, 236, 236, 236),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text(
                'Multitask',
                style: TextStyle(color: Color.fromARGB(255, 8, 4, 252), fontSize: 36, fontFamily: "Montserrat", fontWeight: FontWeight.bold),
                ),
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Image.asset(
                    'images/main_page.png', 
                    width: 25, 
                    height: 25,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Главное меню',
                     style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      fontFamily: "Montserrat",
                      color: _selectedIndex == 0 ? const Color.fromARGB(255, 8, 4, 252) : null,
                    ),
                  ),
                ],
              ),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Image.asset(
                    'images/schedule.png', 
                    width: 25, 
                    height: 25,
                  ),
                  const SizedBox(width: 9),
                  Text(
                    'Расписание',
                     style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      fontFamily: "Montserrat",
                      color: _selectedIndex == 1 ? const Color.fromARGB(255, 8, 4, 252) : null,
                    ),
                  ),
                ],
              ),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 400),
            ListTile(
              title: Row(
                children: <Widget>[
                  Image.asset(
                    'images/settings.png', 
                    width: 25, 
                    height: 25,
                  ),
                  const SizedBox(width: 9),
                  Text(
                    'Настройки',
                     style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      fontFamily: "Montserrat",
                      color: _selectedIndex == 2 ? const Color.fromARGB(255, 8, 4, 252) : null,
                    ),
                  ),
                ],
              ),
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
