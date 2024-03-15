import 'package:flutter/material.dart';
import 'text_style.dart';

//это будем стягивать
List<String> items = [
  'О721Б',
  'О722Б',
  'О723Б',
  'О724Б',
  'О725Б',
  'О726Б',
  'О727Б',
  'О728Б',
];
String? selectedItem;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Приветствуем",
      home: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Приветствуем",
              style: headerTextStyle(),
            )),

        body: Container(
          padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
          child: Column(
            children: [
              Text(
                "Приложение MultiTask поможет вам отслеживать задачи и расписание на день.",
                textAlign: TextAlign.center,
                style: mainTextStyle(),
              ),
              const SizedBox(height: 40),
              Text("Пожалуйста, укажите номер своей группы.",
                  textAlign: TextAlign.center, style: mainTextStyle()),
              const SizedBox(height: 40),
              const DropdownMenu(),
              const SizedBox(height: 40),
              const Row(
                children: [],
              )
            ],
          ),
        ),
        //bottomNavigationBar: BottomNavigationBar()
      ),
    );
  }
}

//выпадающая простата)
// вызывается родитель а не сынок фермера ебаный
class DropdownMenu extends StatefulWidget {
  const DropdownMenu({super.key});
  @override
  State<DropdownMenu> createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<DropdownMenu> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 290,
        child: DropdownButtonFormField<String>(
            menuMaxHeight: 200,
            hint: Text("Выберите номер группы", style: smallTextStyle()),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.black, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.black, width: 2),
              ),
            ),
            value: selectedItem,
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item, style: smallTextStyle()),
                    ))
                .toList(),
            onChanged: (String? item) {
              setState(() {
                selectedItem = item;
              });
            }));
  }
}

//padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
