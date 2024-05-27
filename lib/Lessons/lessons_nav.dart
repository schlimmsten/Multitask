import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? selectedGroup;

class LessonsNav extends StatefulWidget {
  const LessonsNav({super.key});

  @override
  State<LessonsNav> createState() => _LessonsNavState();
}

class _LessonsNavState extends State<LessonsNav> {

  @override
  void initState() {
    super.initState();
    _loadSelectedGroup();
  }

  Future<void> _loadSelectedGroup() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedGroup = prefs.getString('selectedGroup');
      print(selectedGroup);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lessons'),
      ),
      body: Center(
        child: Text(
          selectedGroup != ""
              ? 'Ваша группа: $selectedGroup'
              : 'Группа не выбрана',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
