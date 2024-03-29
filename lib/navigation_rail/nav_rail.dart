import 'package:flutter/material.dart';
import 'package:multitask/main_screen_components/main_screen_builder.dart';
import 'package:multitask/text_style.dart';
import 'package:multitask/main_screen_components/date_builder.dart';
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

  //это удалить потом
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final List<String> _appBarOptions = <String>[
    currentMonthAndYear(),
    "Расписание",
    "Настройки"
  ];

  static const List<Widget> _screenOptions = <Widget>[
    //первый вызов
    MainScreenBuilder(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ), 
    SettingsScreen(), // Добавляем экран настроек в список
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
        //ЧЕ ЗА ХУЙНЯ
        //backgroundColor: Colors.white,
        title: Text(
          _appBarOptions[_selectedIndex],
          style: headerTextStyle(),
          )
        ),
      //надо оборачивать виджеты в экран и вызывать просто экран(но он типа класс/виджет)
      body: _screenOptions[_selectedIndex],
      drawer: Drawer(
        width: 220,
        backgroundColor: Color.fromARGB(255, 236, 236, 236),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 120,
              child: DrawerHeader(
              decoration: const BoxDecoration(
                //color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: Row(
                  children: [
                    Image.asset(
                      'images/MT_blue.png', // Путь к вашей .png иконке
                      width: 73, // Установите желаемую ширину и высоту для иконки
                      height: 73,
                    ),
                    const SizedBox(width: 30),
                    const Text(
                      'Multi\nTask',
                      style: TextStyle(
                        color: Color.fromARGB(255, 8, 4, 252),
                        fontSize: 22,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
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
            const SizedBox(height: 450),
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
