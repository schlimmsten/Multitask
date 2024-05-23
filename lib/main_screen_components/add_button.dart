import 'package:flutter/material.dart';
import 'package:multitask/screens/add_screen.dart';
import 'package:multitask/add_screen_components/category_screen_components/category_picker_components/category_picker.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FloatingActionButton(
        onPressed: () {
          //категорию зануляем так сказать
          chosenCategory = null;
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const AddScreen()));
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add, color: Theme.of(context).appBarTheme.backgroundColor),
      )
    );
  }
}