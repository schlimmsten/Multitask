import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../text_style.dart';

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
Future<void> saveSelectedItem(String? item) async {
    final prefs = await SharedPreferences.getInstance();
    if (item != null) {
      await prefs.setString('selectedGroup', item);
      print(prefs.setString('selectedGroup', item));
    }
  }

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

  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290,
      child: DropdownButtonFormField<String>(
        menuMaxHeight: 200,
        hint: Text("Выберите номер группы", style: smallTextStyle(context)),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 2),
          ),
        ),
        value: selectedItem,
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item, style: smallTextStyle(context)),
                ))
            .toList(),
        onChanged: (String? item) {
          setState(() {
            selectedItem = item;
            saveSelectedItem(item);
          });
          // Не сохраняем здесь
        },
      ),
    );
  }
}
