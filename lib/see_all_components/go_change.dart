import 'package:flutter/material.dart';
//просто заглушка
import '../change_screen_components/change_screen_builder.dart';
import '../text_style.dart';
import '../add_screen_components/data_task/task_form_model.dart';
import '../main_screen_components/task_list.dart';

class GoChangeButton extends StatelessWidget {

  final int index;

  const GoChangeButton({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeScreenBuilder(index: index),));
      },
      style: OutlinedButton.styleFrom(side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor),
      child: Text(
        "Изменить",
        style: addbuttonTextStyle(context)
      ),
    );
  }
}

/*
import 'package:flutter/material.dart'; 
//просто заглушка 
import '../change_screen_components/change_screen_builder.dart'; 
 
class GoChangeButton extends StatelessWidget { 
 
  final int index; 
 
  const GoChangeButton({super.key, required this.index}); 
 
  @override 
  Widget build(BuildContext context) { 
    return Container(
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.only(
        left: 10.0, top: 20.0), // Отступ от нижнего и левого края 
      child: Container(
        constraints: BoxConstraints.tightFor(
          width: MediaQuery.of(context).size.width * 0.9, // Ширина кнопки 
          height: MediaQuery.of(context).size.width * 0.15, // Высота кнопки 
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeScreenBuilder(index: index),));
          },
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.edit_rounded, color: Theme.of(context).appBarTheme.backgroundColor, size: 50,),
        ),
      ),
    );
  } 
}*/