import 'package:flutter/material.dart';
import 'package:multitask/add_screen_components/data_task/task_form_model.dart';
import '../themes/custom_theme.dart';
import 'package:provider/provider.dart';
/*
class NameField extends StatelessWidget {

  const NameField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Введите название задачи',
        hintStyle: addfuelsTextStyle(context)
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Пожалуйста, введите название задачи';
        }
        return null;
      },
    );
  }
}
*/
/*
class NameField extends StatelessWidget {
  const NameField({Key? key}) : super(key: key);


  String getName(BuildContext context) {
    return TextEditingController().text;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Введите название задачи',
        hintStyle: TextStyle(
          fontSize: 16,
          fontFamily: "Montserrat",
          color: Provider.of<CustomTheme>(context).isDarkTheme?Colors.white:Colors.black,
        )
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Пожалуйста, введите название задачи';
        }
        return null;
      },
    );
  }
}
*/
/*
class NameField extends StatelessWidget {
  const NameField({Key? key}) : super(key: key);


  String getName(BuildContext context) {
    return TextEditingController().text;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Введите название задачи',
        hintStyle: TextStyle(
          fontSize: 16,
          fontFamily: "Montserrat",
          color: Provider.of
        <CustomTheme>(context).isDarkTheme ? Colors.white : Colors.black,
        ),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Пожалуйста, введите название задачи';
        }
        return null;
      },
    );
  }
}
*/
/*
class NameField extends StatelessWidget {
     final TextEditingController _textEditingController = TextEditingController();

     @override
     Widget build(BuildContext context) {
       return TextFormField(
         controller: _textEditingController,
         decoration: InputDecoration(
           hintText: 'Введите название задачи',
           hintStyle: TextStyle(
             fontSize: 16,
             fontFamily: "Montserrat",
             color: Colors.black,
           ),
         ),
         validator: (String? value) {
if (value == null || value.isEmpty) {
             return 'Пожалуйста, введите название задачи';
           }
           return null;
         },
       );
     }

     String? getName(BuildContext context) {
       return _textEditingController.text.isNotEmpty ? _textEditingController.text : null;
     }
   }
   */
   /* rabota
  class NameField extends StatefulWidget {
  final ValueChanged<String>? onNameChanged;

  const NameField({Key? key, this.onNameChanged}) : super(key: key);

  @override
  _NameFieldState createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textEditingController,
      onChanged: widget.onNameChanged, // Вызываем колбэк при изменении текста
      decoration: InputDecoration(
        hintText: 'Введите название задачи',
        hintStyle: TextStyle(
          fontSize: 16,
          fontFamily: "Montserrat",
          color: Provider.of<CustomTheme>(context).isDarkTheme ? Colors.white : Colors.black,
        ),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Пожалуйста, введите название задачи';
        }
        return null;
      },
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}

*/
class NameField extends StatefulWidget {

  const NameField({super.key});

  @override
  NameFieldState createState() => NameFieldState();
}

class NameFieldState extends State<NameField> {
  final TextEditingController _textEditingController = TextEditingController();

  @override

  Widget build(BuildContext context) {
    final model = TaskFormModelProvider.of(context)?.model;
    return TextFormField(
      controller: _textEditingController,
      decoration: InputDecoration(
        hintText: 'Введите название задачи',
        hintStyle: TextStyle(
          fontSize: 16,
          fontFamily: "Montserrat",
          color: Provider.of<CustomTheme>(context).isDarkTheme ? Colors.white : Colors.black,
        ),
      ),
      onChanged:(value) => model?.name = value,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Пожалуйста, введите название задачи';
        }
        return null;
      },
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}