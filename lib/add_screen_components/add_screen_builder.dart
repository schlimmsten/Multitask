import 'package:flutter/material.dart';
import 'header.dart';
import 'name_field.dart';
import 'description_field.dart';
import 'category_picker.dart';
import 'date_picker.dart';
import 'add_button.dart';
import 'decline_button.dart';
import '../text_style.dart';
import 'package:multitask/settings_screen_components/line.dart';

class AddScreeBuilder extends StatelessWidget {
  const AddScreeBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: const Header(), centerTitle: true,),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              "Название:",
              textAlign: TextAlign.right,
              style: mainTextStyle(),
            ),
            const SizedBox(height: 10),
            const NameField(),
            const SizedBox(height: 40),
            Text(
              "Описание:",
              textAlign: TextAlign.left,
              style: mainTextStyle(),
            ),
            const SizedBox(height: 10),
            const DescriptionField(),
            const CategoryPicker(),
            const DatePicker(),
            const SizedBox(height: 230),
            const Line(),
            const AddButton(),
            const DeclineButton(),
          ],
        ),
      ),
    );
  }
}