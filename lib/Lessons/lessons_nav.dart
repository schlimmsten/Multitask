import 'package:flutter/material.dart';
import 'package:multitask/internet/database/lesson.dart';
import 'package:multitask/internet/database/lesson_read.dart';
import 'package:multitask/settings_screen_components/line.dart';
import 'package:multitask/text_style.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LessonsNav extends StatefulWidget {
  const LessonsNav({Key? key}) : super(key: key);

  @override
  State<LessonsNav> createState() => _LessonsNavState();
}

class _LessonsNavState extends State<LessonsNav> {
  String? selectedGroup;

  @override
  void initState() {
    super.initState();
    _loadSelectedGroup();
  }

  Future<void> _loadSelectedGroup() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedGroup = prefs.getString('selectedGroup');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LessonRead>(builder: (context, model, child) {
      final lessons = model.lessons;
      return Scaffold(
        body: Column(children: [
          const Line(),
          Expanded(
            child: ListView.separated(
              itemCount: lessons.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildLessonList(context, index, lessons);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: Colors.transparent,
                  height: 10,
                );
              },
            ),
          )
        ]),
      );
    });
  }

  Widget _buildLessonList(BuildContext context, int index, List<Lesson> list) {
    print(list[index].dayTitle);
    return Container(
      height: 90,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 78, 153, 240),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              title: Text(
                list[index].dayTitle,
                
              ),
              subtitle: Text(
                list[index].discipline,
                style: nameTaskTextStyle(context),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
