import 'package:flutter/material.dart';
import '../themes/custom_theme.dart';
import 'package:provider/provider.dart';
import 'package:multitask/screens/main_screen.dart'; //просто заглушка

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: OutlinedButton.styleFrom(side: BorderSide(color: Provider.of<CustomTheme>(context).isDarkTheme? Colors.white:const Color.fromARGB(255, 8, 4, 252), width: 2),
      backgroundColor: Theme.of(context).tabBarTheme.labelColor),
      
      onPressed: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const MainScreen()));
      },
      child: Text(
        "Добавить",
        style: TextStyle(
          fontSize: 20,
          fontFamily: "Montserrat",
          color: Provider.of<CustomTheme>(context).isDarkTheme?Colors.white:Colors.black,
        ),
      ),
    );
  }
}