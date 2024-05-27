import 'package:flutter/material.dart';
import 'header.dart';
import 'name_field.dart';
import 'description_field.dart';
import 'category_screen_components/category_picker_components/category_picker.dart';
import 'date_picker.dart';
import 'add_button.dart';
import 'decline_button.dart';
import '../text_style.dart';
import './data_task/task_form_model.dart';

class AddScreenBuilder extends StatefulWidget {
  const AddScreenBuilder({super.key});

  @override
  State<AddScreenBuilder> createState() => __AddScreenBuilderState();
}

class __AddScreenBuilderState extends State<AddScreenBuilder> {
  final _model = TaskFormModel();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return TaskFormModelProvider(
        model: _model,
        child: AddScreenBodyBuilder(formKey: _formKey),
    );
  }
}

class AddScreenBodyBuilder extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const AddScreenBodyBuilder({super.key, required this.formKey});

  @override
  State<AddScreenBodyBuilder> createState() => _AddScreenBodyBuilderState();
}

class _AddScreenBodyBuilderState extends State<AddScreenBodyBuilder> {
  void updateWidget() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Header(),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Form(
            key: widget.formKey,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text("Название:",
                    textAlign: TextAlign.right,
                    style: addtitlesTextStyle(context)),
                SizedBox(height: MediaQuery.of(context).size.height * 0.008),
                const NameField(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Text("Описание:",
                    textAlign: TextAlign.left,
                    style: addtitlesTextStyle(context)),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                const DescriptionField(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                CategoryPicker(onPressed: () => updateWidget(), model: TaskFormModelProvider.of(context)!.model),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                DatePicker(model: TaskFormModelProvider.of(context)!.model),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                AddButton(formKey: widget.formKey),
                SizedBox(height: MediaQuery.of(context).size.height * 0.14),
                const DeclineButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
