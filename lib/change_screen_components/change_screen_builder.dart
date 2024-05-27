import 'package:flutter/material.dart';
import 'header.dart';
import '../add_screen_components/name_field.dart';
import '../add_screen_components/description_field.dart';
import '../add_screen_components/date_picker.dart';
import '../add_screen_components/category_screen_components/category_picker_components/category_picker.dart';
import '../add_screen_components/decline_button.dart';
import 'change_button.dart';
import '../text_style.dart';
import '../add_screen_components/data_task/task_form_model.dart';

class ChangeScreenBuilder extends StatefulWidget {
  final int index;

  const ChangeScreenBuilder({super.key, required this.index});

  @override
  State<ChangeScreenBuilder> createState() => __AddScreenBuilderState();
}

class __AddScreenBuilderState extends State<ChangeScreenBuilder> {
  final _model = TaskFormModel();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return TaskFormModelProvider(
        model: _model, child: ChangeScreenBodyBuilder(index: widget.index, formKey: _formKey));
  }
}

class ChangeScreenBodyBuilder extends StatefulWidget {
  final int index;
  final GlobalKey<FormState> formKey;
  const ChangeScreenBodyBuilder({super.key, required this.index, required this.formKey});

  @override
  State<ChangeScreenBodyBuilder> createState() => _AddScreenBodyBuilderState();
}

class _AddScreenBodyBuilderState extends State<ChangeScreenBodyBuilder> {
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
              CategoryPicker(
                  onPressed: () => updateWidget(),
                  model: TaskFormModelProvider.of(context)!.model),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              DatePicker(model: TaskFormModelProvider.of(context)!.model),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              //const Line(),
              ChangeButton(index: widget.index, formKey: widget.formKey,),
              SizedBox(height: MediaQuery.of(context).size.height * 0.14),
              const DeclineButton(),
            ],
          ),
        )),
      ),
    );
  }
}
