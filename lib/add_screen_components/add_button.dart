import 'package:flutter/material.dart';
//просто заглушка
import '../text_style.dart';
import './data_task/task_form_model.dart';
//import 'save_task.dart';
/*
class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: OutlinedButton.styleFrom(side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor),
      
      onPressed: () {
        String? taskName = NameField().getName(context);
        DateTime? selectedDateTime = DatePicker().getSelectedDateTime();
        if (taskName != null && selectedDateTime != null){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => MainScreen(taskName: taskName,dateTime: selectedDateTime)));
        }
        
        

      },
      child: Text(
        "Добавить",
        style: TextStyle(
          fontSize: 20,
          fontFamily: "Montserrat",
          color: Provider.of<CustomTheme>(context).isDarkTheme?Colors.white:Colors.black,
        ),
      ),
    );
  }
}
*/
/*
class AddButton extends StatelessWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: Provider.of<CustomTheme>(context).isDarkTheme ? Colors.white : const Color.fromARGB(255, 8, 4, 252),
          width: 2,
        ),
        backgroundColor: Theme.of(context).tabBarTheme.labelColor,
      ),
      onPressed: () {

        String? taskName = NameField().getName(context);
     
        DateTime? selectedDate = DatePicker().getSelectedDateTime();
        
        if (taskName != null && selectedDate != null) {

          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => MainScreen(taskName: taskName, dateTime: getSelectedDateTime )));
        } else {
        }
      },
      child: Text(
        "Добавить",
        style: TextStyle(
          fontSize: 20,
          fontFamily: "Montserrat",
          color: Provider.of<CustomTheme>(context).isDarkTheme ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
*/
/*
class AddButton extends StatelessWidget {
     const AddButton({Key? key}) : super(key: key);

     @override
     Widget build(BuildContext context) {
       return ElevatedButton(
         style: ElevatedButton.styleFrom(
           side: BorderSide(
             color: Colors.blue, // Измените цвет рамки по своему усмотрению
             width: 2,
           ),
           backgroundColor: Colors.blue, // Измените цвет кнопки по своему усмотрению
         ),
         onPressed: () {
           String? taskName = NameField().getName(context);
           DateTime? selectedDateTime = DatePicker().getSelectedDateTime();
           if (taskName != null && selectedDateTime != null) {
             //Navigator.of(context).push(MaterialPageRoute(builder: (_) => MainScreen(taskName: taskName, dateTime: selectedDateTime)));
             Navigator.of(context).push(MaterialPageRoute(builder: (_) => MainScreenBuilder(taskName: taskName, dateTime: selectedDateTime)));
             
           }
         },
         child: Text(
           "Добавить",
           style: TextStyle(
             fontSize: 20,
             fontFamily: "Montserrat",
             color: Colors.white, // Измените цвет текста по своему усмотрению
           ),
         ),
       );
     }
   }
   */

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ()=>TaskFormModelProvider.of(context)?.model.saveTask(context),
      style: OutlinedButton.styleFrom(side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor),
      child: Text(
        "Добавить",
        style: addbuttonTextStyle(context)
      ),
    );
  }
}