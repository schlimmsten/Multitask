import 'package:flutter/material.dart';  
import 'package:multitask/add_screen_components/data_task/task_model.dart'; 
import 'package:multitask/add_screen_components/decline_button.dart'; 
import 'package:multitask/see_all_components/go_change.dart';  
import 'package:multitask/see_all_components/header.dart'; 
import 'package:multitask/text_style.dart';  
import 'package:provider/provider.dart';  

class SeeAllBuilder extends StatelessWidget {   
  const SeeAllBuilder({super.key, required this.index});   

  final int index;

  @override   
  Widget build(BuildContext context) {   
    return Consumer<TaskModel>(   
      // Использование Consumer для доступа к TaskModel   
      builder: (context, model, child) {   
        final tasks = model.tasks;   
        final task = tasks[index]; 
        
        return Scaffold(   
          appBar: AppBar(   
            title: const Header(),   
            centerTitle: true,   
            automaticallyImplyLeading: false,   
          ),   
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, // чтобы залупа вначале была
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    width: 300,
                    height: 400,
                    margin: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: task.color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          task.name,
                          textAlign: TextAlign.center,
                          style: addtitlesTextStyle(context).copyWith(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: colorSelectedChange(context),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Описание:',
                          style: addtitlesTextStyle(context).copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: colorSelectedChange(context),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          task.description,
                          textAlign: TextAlign.left,
                          style: addtitlesTextStyle(context).copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: colorSelectedChange(context),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Категория:',
                          style: addtitlesTextStyle(context).copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: colorSelectedChange(context),
                            ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          task.category,
                          textAlign: TextAlign.left,
                          style: addtitlesTextStyle(context).copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: colorSelectedChange(context),
                                                 ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Время:',
                          style: addtitlesTextStyle(context).copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: colorSelectedChange(context),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          task.selectedTime,
                          textAlign: TextAlign.left,
                          style: addtitlesTextStyle(context).copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: colorSelectedChange(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                GoChangeButton(index: index),
                const SizedBox(height: 20),
                const DeclineButton(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );   
      },  
    );   
  }   
}
