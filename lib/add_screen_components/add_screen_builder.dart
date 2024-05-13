import 'package:flutter/material.dart';
import 'header.dart';
import 'name_field.dart';
import 'description_field.dart';
import 'category_picker.dart';
import 'date_picker.dart';
import 'add_button.dart';
import 'decline_button.dart';
import '../text_style.dart';

class AddScreeBuilder extends StatelessWidget {
  const AddScreeBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Header(),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            //padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text(
                  "Название:",
                  textAlign: TextAlign.right,
                  style: addtitlesTextStyle(context)
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.008),
                const NameField(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Text(
                  "Описание:",
                  textAlign: TextAlign.left,
                  style: addtitlesTextStyle(context)
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                const DescriptionField(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                const CategoryPicker(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                const DatePicker(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                //const Line(),
                const AddButton(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.14),
                const DeclineButton(),
              ],
            ),
          )),
    );
  }
}
