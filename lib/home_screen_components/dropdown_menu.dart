import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../text_style.dart';
import '../internet/fetch_groups.dart';

String? selectedItem;

class DropdownMenu extends StatefulWidget {
  const DropdownMenu({super.key});

  @override
  State<DropdownMenu> createState() => DropdownMenuState();
}

class DropdownMenuState extends State<DropdownMenu> {

  @override
  void initState() {
    super.initState();
    _loadSelectedItem();
  }

  Future<void> _loadSelectedItem() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedItem = prefs.getString('selectedGroup');
    });
  }

  Future<void> saveSelectedItem(String? item) async {
    final prefs = await SharedPreferences.getInstance();
    if (item != null) {
      await prefs.setString('selectedGroup', item);
      print(prefs.setString('selectedGroup', item));
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String?>>(
      future: fetchGroups(),
      builder: (BuildContext context, AsyncSnapshot<List<String?>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Ошибка: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('Нет данных');
        } else {
          List<String?> items = snapshot.data!;
          return SizedBox(
            width: 290,
            child: DropdownButtonFormField<String?>(
              menuMaxHeight: 200,
              hint: Text("Выберите номер группы", style: smallTextStyle(context)),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
                ),
              ),
              value: selectedItem,
              items: items
                  .map((item) => DropdownMenuItem<String?>(
                        value: item,
                        child: Text(item!, style: smallTextStyle(context).copyWith(color: Colors.black)), // Измените цвет элементов списка здесь
                      ))
                  .toList(),
              onChanged: (String? item) {
                setState(() {
                  selectedItem = item;
                  saveSelectedItem(item);
                });
              },
              selectedItemBuilder: (BuildContext context) {
                return items.map<Widget>((String? item) {
                  return Text(
                    item!,
                    style: smallTextStyle(context).copyWith(fontWeight: FontWeight.bold), // Измените цвет выбранного элемента здесь
                  );
                }).toList();
              },
            ),
          );
        }
      },
    );
  }
}
