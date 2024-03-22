//тут будет общий стиль для всех текстов
//пока что мне лень и я не придумал общий внешний вид

import 'package:flutter/material.dart';

TextStyle headerTextStyle() => const TextStyle(
  fontSize: 28, 
  color: Colors.black87, 
  fontWeight: FontWeight.bold,
  fontFamily: "Montserrat",
  //centerTitle: true,
);

TextStyle mainTextStyle() => const TextStyle(
  fontSize: 21, 
  color: Colors.black87,
  fontFamily: "Montserrat",
);

TextStyle smallTextStyle() => const TextStyle(
  fontSize: 18, 
  color: Colors.black87,
  fontFamily: "Montserrat",
);

TextStyle redSmallTextStyle() => const TextStyle(
  fontSize: 18, 
  color: Colors.red,
  fontFamily: "Montserrat",
);