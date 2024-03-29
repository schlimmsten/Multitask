import 'package:flutter/material.dart';
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
                borderSide: const BorderSide(color:  Color.fromARGB(255, 8, 4, 252), width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Color.fromARGB(255, 8, 4, 252), width: 2),
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