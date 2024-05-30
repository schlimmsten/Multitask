import 'package:flutter/material.dart';
import 'package:multitask/internet/database/lesson.dart';
import 'package:multitask/internet/database/lesson_read.dart';
import 'package:multitask/internet/fetch_data.dart';
import 'package:multitask/settings_screen_components/line.dart';
import 'package:multitask/text_style.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home_screen_components/dropdown_menu.dart' as dp;

class LessonsNav extends StatefulWidget {
  const LessonsNav({super.key});

  @override
  State<LessonsNav> createState() => _LessonsNavState();
}

class _LessonsNavState extends State<LessonsNav> {
  late String? selectedGroup;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadSelectedItem();
  }

  Future<void> _loadSelectedItem() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedGroup = prefs.getString('selectedGroup');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LessonRead>(builder: (context, model, child) {
      return Scaffold(
        body: Column(
          children: [
            const Line(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const dp.DropdownMenu(),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        model.fetchLessonsForGroup();
                        fetchData();
                      });
                    },
                    child: const Icon(Icons.refresh, color: Colors.black))
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Expanded(
              child: ListView(
                children: [
                  if (model.lessonsMon.isNotEmpty)
                    _buildDayLessons("Понедельник", model.lessonsMon, context),
                  if (model.lessonsMon.isNotEmpty)
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  if (model.lessonsTue.isNotEmpty)
                    _buildDayLessons("Вторник", model.lessonsTue, context),
                  if (model.lessonsTue.isNotEmpty)
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  if (model.lessonsWed.isNotEmpty)
                    _buildDayLessons("Среда", model.lessonsWed, context),
                  if (model.lessonsWed.isNotEmpty)
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  if (model.lessonsThu.isNotEmpty)
                    _buildDayLessons("Четверг", model.lessonsThu, context),
                  if (model.lessonsThu.isNotEmpty)
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  if (model.lessonsFri.isNotEmpty)
                    _buildDayLessons("Пятница", model.lessonsFri, context),
                  if (model.lessonsFri.isNotEmpty)
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  if (model.lessonsSat.isNotEmpty)
                    _buildDayLessons("Суббота", model.lessonsSat, context),
                  if (model.lessonsSat.isNotEmpty)
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  if (model.lessonsSun.isNotEmpty)
                    _buildDayLessons("Воскресенье", model.lessonsSun, context),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildDayLessons(
      String day, List<Lesson>? lessons, BuildContext context) {
    if (lessons == null || lessons.isEmpty) {
      return const SizedBox(); // Вернуть пустой контейнер или другой виджет, если список уроков пустой или null
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
              child: Text(
            day,
            style: disciplineTextStyle(context).copyWith(fontSize: 24),
          )),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        DayLessonsList(context, lessons),
      ],
    );
  }

  Widget DayLessonsList(BuildContext context, List<Lesson> lessons) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
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
    );
  }

  Widget _buildLessonList(BuildContext context, int index, List<Lesson> list) {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      padding: const EdgeInsets.all(10.0), // Add padding inside the container
      decoration: BoxDecoration(
        color: list[index].weekCode == 1
            ? const Color.fromARGB(255, 78, 153, 240).withOpacity(0.5)
            : const Color.fromARGB(255, 240, 78, 78).withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
          child: Container(
              child: Column(
        children: [
          Text(
            list[index].discipline,
            style: disciplineTextStyle(context),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: 2.9,
              color:
                  colorLine(context, Theme.of(context).scaffoldBackgroundColor),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                  width: 90,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: Colors.white,
                        size: 36,
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        list[index].time,
                        style: disciplineTextStyle(context).copyWith(
                            fontSize: 22, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 2.9,
                  height: 85.0,
                  color: colorLine(
                      context, Theme.of(context).scaffoldBackgroundColor),
                  padding: const EdgeInsets.only(top: 0.0),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (list[index].classroom != "")
                    Row(
                      children: [
                        const Icon(
                          Icons.pin_drop,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02),
                        Text(list[index].classroom,
                            style: disciplineTextStyle(context).copyWith(
                                fontSize: 26, fontWeight: FontWeight.w900)),
                      ],
                    ),
                  const SizedBox(height: 5.0),
                  if (list[index].lecturer != "")
                    Row(
                      children: [
                        const Icon(
                          weight: 800,
                          Icons.face,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02),
                        Text(list[index].lecturer,
                            style: disciplineTextStyle(context)),
                      ],
                    )
                ],
              ),
            ],
          )
        ],
      ),));
  }
}
