import 'package:flutter/material.dart';
import 'package:multitask/main_screen_components/main_screen_builder.dart';
import 'package:multitask/text_style.dart';
import '../screens/settings_screen.dart';
import '../themes/custom_theme.dart';
import 'package:provider/provider.dart';

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

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  NavigationState createState() => NavigationState();
}

class NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  late List<String> _appBarOptions;
  late void Function(DateTime) _updateAppBarOptions; // Добавьте это поле
  late MainScreenBuilder _mainScreenBuilder;
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    _appBarOptions = [currentMonthAndYear(), "Расписание", "Настройки"];
    _updateAppBarOptions = _updateAppBarOptionsMethod;
    _updateAppBarOptions(DateTime.now());
    selectedDate = DateTime.now();
    _mainScreenBuilder = MainScreenBuilder(
    onDateScrolled: _updateAppBarOptions, selectedDate: selectedDate);
  }

  void _updateAppBarOptionsMethod(DateTime currentDate) {
    int month = currentDate.month;
    int year = currentDate.year;
    setState(() {
      _appBarOptions[0] = '${months[month - 1]} $year';
    });
  }

  void _onDateSelected(DateTime newDate) {
    setState(() {
      selectedDate = newDate;
    });
    _mainScreenBuilder
        .onDateSelected(newDate); // Обновляем дату в MainScreenBuilder
    // Переход к выбранной дате в DateBuilder
    _mainScreenBuilder.goToSelectedWeek(newDate);
  }

  late final List<Widget> _screenOptions = <Widget>[
    _mainScreenBuilder,
    const Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _openDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            primaryColor: const Color.fromARGB(255, 78, 153, 240),
            colorScheme: const ColorScheme.light(
              primary:
                  Color.fromARGB(255, 78, 153, 240), // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(
                    255, 78, 153, 240), // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      _onDateSelected(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomTheme>(
      builder: (context, customTheme, child) {
        return Scaffold(
          appBar: AppBar(
            title: GestureDetector(
              onTap: () {
                _openDatePicker(context);
              },
              child: Text(
                _appBarOptions[_selectedIndex],
                style: headerTextStyle(context),
              ),
            ),
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          ),
          body: _screenOptions[_selectedIndex],
          drawer: Drawer(
            width: 220,
            backgroundColor: customTheme.currentTheme.appBarTheme
                .backgroundColor, // Использовать цвет из текущей темы
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.17,
                  child: DrawerHeader(
                    child: Row(
                      children: [
                        Image.asset(
                          Provider.of<CustomTheme>(context).isDarkTheme
                              ? 'images/MT_white.png'
                              : 'images/MT_blue.png',
                          width: 73,
                          height: 73,
                        ),
                        const SizedBox(width: 30),
                        Text(
                          'Multi\nTask',
                          style: toolbartitleTextStyle(context),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Image.asset(
                        Provider.of<CustomTheme>(context).isDarkTheme
                            ? 'images/main_page_white.png'
                            : 'images/main_page_blue.png',
                        width: 25,
                        height: 25,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Главное меню',
                        style: toolbar1TextStyle(context, _selectedIndex),
                      ),
                    ],
                  ),
                  selected: _selectedIndex == 0,
                  onTap: () {
                    _onItemTapped(0);
                    Navigator.pop(context);
                    _onDateSelected(DateTime.now());
                  },
                ),
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Image.asset(
                        Provider.of<CustomTheme>(context).isDarkTheme
                            ? 'images/schedule_white.png'
                            : 'images/schedule_blue.png',
                        width: 25,
                        height: 25,
                      ),
                      const SizedBox(width: 9),
                      Text(
                        'Расписание',
                        style: toolbar2TextStyle(context, _selectedIndex),
                      ),
                    ],
                  ),
                  selected: _selectedIndex == 1,
                  onTap: () {
                    _onItemTapped(1);
                    Navigator.pop(context);
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.55),
                  child: ListTile(
                    title: Row(
                      children: <Widget>[
                        Image.asset(
                          Provider.of<CustomTheme>(context).isDarkTheme
                              ? 'images/settings_white.png'
                              : 'images/settings_blue.png',
                          width: MediaQuery.of(context).size.width *
                              0.05, // 5% ширины экрана
                          height: MediaQuery.of(context).size.width *
                              0.05, // 5% ширины экрана
                        ),
                        const SizedBox(width: 9),
                        Text(
                          'Настройки',
                          style: toolbar3TextStyle(context, _selectedIndex),
                        ),
                      ],
                    ),
                    onTap: () {
                      _onItemTapped(2);
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
