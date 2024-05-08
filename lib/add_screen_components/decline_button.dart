import 'package:flutter/material.dart';
import 'package:multitask/screens/main_screen.dart'; //просто заглушка

class DeclineButton extends StatelessWidget {
  const DeclineButton({super.key});

  @override
  Widget build(BuildContext context) {
     return Container(
            alignment:
                Alignment.bottomLeft, // Выравнивание по нижнему левому краю
            padding: const EdgeInsets.only(
                left: 10.0, top: 20.0), // Отступ от нижнего и левого края
            child: Container(
              constraints: BoxConstraints.tightFor(
                width: MediaQuery.of(context).size.width * 0.9, // Ширина кнопки
                height:
                    MediaQuery.of(context).size.width * 0.15, // Высота кнопки
              ),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const MainScreen()));
                },
                backgroundColor: Theme.of(context).primaryColor,
                
                child: Icon(Icons.arrow_back_rounded, color: Theme.of(context).appBarTheme.backgroundColor, size: 50,),
              ),
            ),
          );
  }
}