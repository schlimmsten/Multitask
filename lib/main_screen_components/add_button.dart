import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FloatingActionButton(
        onPressed: () {
        // момент добавления компонента
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      )
    );
  }
}