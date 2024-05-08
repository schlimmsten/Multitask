import 'package:flutter/material.dart';
import 'package:multitask/text_style.dart';
//import '../dropdown/dropdown_menu.dart' as dp;
import '../home_screen_components/dropdown_menu.dart' as dp;
import '../home_screen_components/skip_button.dart';
import '../home_screen_components/continue_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Получаем размеры экрана
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Вычисляем отступы и расстояния между элементами, основываясь на размерах экрана
    final double topPadding = screenHeight * 0.1;
    final double middleSpacing = screenHeight * 0.08;
    final double bottomSpacing = screenHeight * 0.03;
    
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Приветствуем,",
            style: headerTextStyle(context),
          )),

      body: Container(
        padding: EdgeInsets.fromLTRB(screenWidth * 0.05, topPadding, screenWidth * 0.05, 0),
        child: Column(
          children: [
            Image.asset('images/hand.png'),
            SizedBox(height: middleSpacing),
            Text("Пожалуйста, укажите номер своей группы.",
                textAlign: TextAlign.center, style: mainTextStyle(context)),
            SizedBox(height: bottomSpacing),  
            const dp.DropdownMenu(),
            SizedBox(height: topPadding),
            const ContinueButton(),
            //const SizedBox(height: 20),
            const SkipButton()
          ],
        ),
      ),
      //bottomNavigationBar: BottomNavigationBar()
    );
  }
}


//import '../home_screen_components/dropdown_menu.dart' as dp;