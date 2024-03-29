import 'package:flutter/material.dart';
import 'package:multitask/screens/main_screen.dart';

class BackButtonMenu extends StatelessWidget {
  const BackButtonMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            alignment:
                Alignment.bottomLeft, // Выравнивание по нижнему левому краю
            padding: const EdgeInsets.only(
                left: 20.0, top: 20.0), // Отступ от нижнего и левого края
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
                
                child: Icon(Icons.arrow_back_rounded, color: Theme.of(context).iconTheme.color, size: 50,),
              ),
            ),
          );
  }
}