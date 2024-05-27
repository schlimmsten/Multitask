import 'package:flutter/material.dart';

//возможно придется поменять на stateful!!!

//TextEditingController textController = TextEditingController();

class CategoryName extends StatefulWidget {
  const CategoryName({super.key});

  static final TextEditingController _textController = TextEditingController();

  static TextEditingController get textController => _textController;
  

  @override
  State<CategoryName> createState() => _CategoryNameState();
}

class _CategoryNameState extends State<CategoryName> {
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      decoration: const InputDecoration(
      contentPadding: EdgeInsets.only(left: 65),
      hintText: 'Введите название...',
      hintStyle: TextStyle(
        fontSize: 20,
        fontFamily: "Montserrat",
        color: Colors.black,
        )
      ),
      controller: CategoryName.textController,
    );
  }
}