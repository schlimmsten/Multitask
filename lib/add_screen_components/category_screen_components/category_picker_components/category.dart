import 'package:flutter/material.dart';
import 'category_picker_builder.dart';
import 'package:provider/provider.dart';
import '../../../themes/custom_theme.dart';
import 'package:multitask/text_style.dart';

// ignore: must_be_immutable
class Category extends StatefulWidget {

  Map<String, dynamic> category;

  Category({super.key, required this.category});

  @override
  // ignore: no_logic_in_create_state
  State<Category> createState() => _CategoryState(category);
}

class _CategoryState extends State<Category> {

  Map<String, dynamic> category;
  _CategoryState(this.category);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: category["color"], radius: 10),
        const SizedBox(width: 10),
        Text(
          category["name"],
          style: smallalwaysblackTextStyle(context)
        ),
        const Spacer(),
        (category["name"] != "Добавить свою")
        ? ElevatedButton(
          //тут удаление категории!
          //не обновляется
          onPressed: () {
            setState(() {
              categories.remove(category);
            });
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
          ),
          child: Icon(
            Icons.close_outlined, 
            color: Provider.of<CustomTheme>(context).isDarkTheme
              ?Colors.white
              :Colors.black,),
        )
        //ебанутейший костыль 
        : const Text("")
      ],
    );
  }
}