import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.5,
        child: CustomNavigationRail(
          currentIndex: _currentIndex,
          onItemSelected: (int index) {
            setState(() {
              _currentIndex = index;
            });
            Navigator.pop(context); // Close drawer after selection
          },
        ),
        
      ),
      body: Center(
        child: _getPageContent(_currentIndex),
      ),
    );
  }

  Widget _getPageContent(int index) {
    switch (index) {
      case 0:
        return const Text('Home Page Content');
      case 1:
        return const Text('Favorites Page Content');
      case 2:
        return const Text('Settings Page Content');
      default:
        return const Text('Invalid Index');
    }
  }
}

class CustomNavigationRail extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onItemSelected;

  const CustomNavigationRail({super.key, 
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: currentIndex,
      onDestinationSelected: onItemSelected,
      labelType: NavigationRailLabelType.selected,
      
      destinations: const [
        NavigationRailDestination(
          icon: Align(
            alignment: Alignment.centerLeft, // Выравниваем иконку по левому краю
            child: Padding(
              padding: EdgeInsets.only(top: 100),
              child: Row(
              children: [
                Icon(Icons.home, color: Color.fromARGB(255, 25, 10, 233), size: 35,),
                SizedBox(width: 8,), // Добавим небольшой отступ между иконкой и текстом
                Text('Главное меню', style: TextStyle(fontSize: 17),),
              ],
            ),
            ),
            
          ),
          label: Align(
            alignment: Alignment.centerLeft, // Выравниваем текст по левому краю
            child: Padding(
              padding: EdgeInsets.only(right: 50),
                child: Text(''),
            ),
          ),
        ),
        NavigationRailDestination(
          icon: Align(
            alignment: Alignment.centerLeft, // Выравниваем иконку по левому краю
            child: Padding(
              padding: EdgeInsets.only(right: 40),
              child: Icon(Icons.search, size: 35),
            ),
          ),
          label: Align(
            alignment: Alignment.centerLeft, // Выравниваем текст по левому краю
            child: Padding(
              padding: EdgeInsets.only(right: 50),
              child: Text(''),
            ),
          ),
        ),

      ],
      minExtendedWidth: MediaQuery.of(context).size.width * 0.1, // Setting min width of extended menu
      extended: MediaQuery.of(context).size.width > 600, // Switching to extended mode based on screen width
    );
  }
}
