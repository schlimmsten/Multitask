import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../themes/custom_theme.dart';

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
      decoration: InputDecoration(
      contentPadding: const EdgeInsets.only(left: 65),
      hintText: 'Введите название...',
      hintStyle: TextStyle(
        fontSize: 20,
        fontFamily: "Montserrat",
        color: Provider.of<CustomTheme>(context).isDarkTheme?Colors.white:Colors.black,
        )
      ),
      controller: CategoryName.textController,
    );
  }
}