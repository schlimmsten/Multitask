import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 35, 31, 240),
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Business'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('School'),
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


// import 'package:flutter/material.dart';

// class Rail extends StatefulWidget {
//   final Function(int) onItemSelected;
//   const Rail({super.key, required this.onItemSelected});

//   @override
//   _RailState createState() => _RailState();
// }

// class _RailState extends State<Rail> {
//   int _currentIndex = 0;
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.menu),
//           onPressed: () {
//             _scaffoldKey.currentState?.openDrawer();
//           },
//         ),
//       ),
//       drawer: Drawer(
//         width: MediaQuery.of(context).size.width * 0.5,
//         child: CustomNavigationRail(
//           currentIndex: _currentIndex,
//           onItemSelected: (int index) {
//             setState(() {
//               _currentIndex = index;
//             });
//             Navigator.pop(context); // Close drawer after selection
//           },
//         ),
        
//       ),
//       body: Center(
//         child: _getPageContent(_currentIndex),
//       ),
//     );
//   }

//   Widget _getPageContent(int index) {
//     switch (index) {
//       case 0:
//         return const Text('Home Page Content');
//       case 1:
//         return const Text('Favorites Page Content');
//       case 2:
//         return const Text('Settings Page Content');
//       default:
//         return const Text('Invalid Index');
//     }
//   }
// }

// class CustomNavigationRail extends StatelessWidget {
//   final int currentIndex;
//   final void Function(int) onItemSelected;

//   const CustomNavigationRail({super.key, 
//     required this.currentIndex,
//     required this.onItemSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return NavigationRail(
//       selectedIndex: currentIndex,
//       onDestinationSelected: onItemSelected,
//       labelType: NavigationRailLabelType.selected,
      
//       destinations: const [
//         NavigationRailDestination(
//           icon: Align(
//             alignment: Alignment.centerLeft, // Выравниваем иконку по левому краю
//             child: Padding(
//               padding: EdgeInsets.only(top: 100),
//               child: Row(
//               children: [
//                 Icon(Icons.home, color: Color.fromARGB(255, 25, 10, 233), size: 35,),
//                 SizedBox(width: 8,), // Добавим небольшой отступ между иконкой и текстом
//                 Text('Главное меню', style: TextStyle(fontSize: 17),),
//               ],
//             ),
//             ),
            
//           ),
//           label: Align(
//             alignment: Alignment.centerLeft, // Выравниваем текст по левому краю
//             child: Padding(
//               padding: EdgeInsets.only(right: 50),
//                 child: Text(''),
//             ),
//           ),
//         ),
//         NavigationRailDestination(
//           icon: Align(
//             alignment: Alignment.centerLeft, // Выравниваем иконку по левому краю
//             child: Padding(
//               padding: EdgeInsets.only(right: 40),
//               child: Icon(Icons.search, size: 35),
//             ),
//           ),
//           label: Align(
//             alignment: Alignment.centerLeft, // Выравниваем текст по левому краю
//             child: Padding(
//               padding: EdgeInsets.only(right: 50),
//               child: Text(''),
//             ),
//           ),
//         ),

//       ],
//       minExtendedWidth: MediaQuery.of(context).size.width * 0.1, // Setting min width of extended menu
//       extended: MediaQuery.of(context).size.width > 600, // Switching to extended mode based on screen width
//     );
//   }
// }
