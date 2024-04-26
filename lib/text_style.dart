import 'package:flutter/material.dart';
import '../themes/custom_theme.dart';
import 'package:provider/provider.dart';

//Крч суть в очередном наследовании элементов. В самом начале общие стили,
//которые накладываются друг на друга за счет наследования, а потом при создании
//нового стиля для какого-то определенного элемента просто наследуем от уже созданных

TextStyle commonTextStyle(context) => const TextStyle(fontFamily: "Montserrat");
TextStyle blackwhiteTextStyle(context) => commonTextStyle(context).copyWith(
      color: Provider.of<CustomTheme>(context).isDarkTheme
          ? Colors.white
          : Colors.black,
    );
TextStyle alwaysblackTextStyle(context) => commonTextStyle(context).copyWith(
      color: Colors.black,
    );

TextStyle addbuttonTextStyle(context) => blackwhiteTextStyle(context).copyWith(
      fontSize: 20,
    );

TextStyle addtitlesTextStyle(context) => blackwhiteTextStyle(context).copyWith(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    );
TextStyle addfuelsTextStyle(context) => blackwhiteTextStyle(context).copyWith(
      fontSize: 16,
    );
TextStyle skipbuttonTextStyle(context) => commonTextStyle(context).copyWith(
    decoration: TextDecoration.underline,
    decorationColor: Colors.grey,
    fontSize: 18,
    color: Colors.grey);

TextStyle dateofweekTextStyle(context, bool isSelected, String day) =>
    commonTextStyle(context).copyWith(
      fontSize: 18,
      fontFamily: "Montserrat",
      color: ((day == 'СБ' || day == 'ВС') && !isSelected)
          ? Colors.red
          : (isSelected
              ? Theme.of(context).appBarTheme.backgroundColor
              : Provider.of<CustomTheme>(context).isDarkTheme
                  ? Colors.white
                  : Colors.black),
      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
    );
ButtonStyle buttondayButtonStyle(context, bool isSelected) => ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color?>(isSelected
        ? Theme.of(context).primaryColor
        : Theme.of(context).appBarTheme.backgroundColor),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
    )));

TextStyle toolbartitleTextStyle(context) => commonTextStyle(context).copyWith(
      color: Theme.of(context).primaryColor,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    );
TextStyle toolbar1TextStyle(context, int selectedIndex) =>
    commonTextStyle(context).copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 19,
      color: selectedIndex == 0
          ? const Color.fromARGB(255, 78, 153, 240)
          : Theme.of(context).textTheme.displayLarge?.color ?? Colors.black,
    );
TextStyle toolbar2TextStyle(context, int selectedIndex) =>
    commonTextStyle(context).copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 19,
      color: selectedIndex == 1
          ? const Color.fromARGB(255, 78, 153, 240)
          : Theme.of(context).textTheme.displayLarge?.color ?? Colors.black,
    );
TextStyle toolbar3TextStyle(context, int selectedIndex) =>
    commonTextStyle(context).copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 19,
      color: selectedIndex == 2
          ? const Color.fromARGB(255, 78, 153, 240)
          : Theme.of(context).textTheme.displayLarge?.color ?? Colors.black,
    );
TextStyle headerTextStyle(context) => blackwhiteTextStyle(context).copyWith(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    );
TextStyle mainTextStyle(context) => blackwhiteTextStyle(context).copyWith(
      fontSize: 21,
    );
TextStyle mainalwaysblackTextStyle(context) =>
    alwaysblackTextStyle(context).copyWith(
      fontSize: 21,
    );
TextStyle smallTextStyle(context) => blackwhiteTextStyle(context).copyWith(
      fontSize: 18,
    );
TextStyle smallalwaysblackTextStyle(context) =>
    alwaysblackTextStyle(context).copyWith(
      fontSize: 18,
    );
TextStyle settingsTextStyle(context) => blackwhiteTextStyle(context).copyWith(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

TextStyle redSmallTextStyle(context) => commonTextStyle(context).copyWith(
      fontSize: 18,
      color: Colors.red,
    );
