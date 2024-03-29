//тут будет общий стиль для всех текстов
//пока что мне лень и я не придумал общий внешний вид

import 'package:flutter/material.dart';

//возможно нужны text_style_light и text_style_dark 

TextStyle headerTextStyle() => const TextStyle(

  fontSize: 28, 
  fontWeight: FontWeight.bold,
  fontFamily: "Montserrat",
);

TextStyle mainTextStyle() => const TextStyle(
  fontSize: 21, 
  fontFamily: "Montserrat",
  //color: Colors.black
);

TextStyle smallTextStyle() => const TextStyle(
  fontSize: 18,
  fontFamily: "Montserrat",
  //color: Colors.black
);

TextStyle settingsTextStyle() => const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  fontFamily: "Montserrat",
  //color: Colors.black
);

TextStyle redSmallTextStyle() => const TextStyle(
  fontSize: 18, 
  color: Colors.red,
  fontFamily: "Montserrat",
);