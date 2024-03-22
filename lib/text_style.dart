//тут будет общий стиль для всех текстов
//пока что мне лень и я не придумал общий внешний вид

import 'package:flutter/material.dart';
//import 'screens/settings_screen.dart';

TextStyle headerTextStyle() => const TextStyle(

  fontSize: 28, 
  fontWeight: FontWeight.bold,
  fontFamily: "Montserrat",
);

TextStyle mainTextStyle() => const TextStyle(
  fontSize: 21, 
  fontFamily: "Montserrat",
);

TextStyle smallTextStyle() => const TextStyle(
  fontSize: 18,
  fontFamily: "Montserrat",
);

TextStyle settingsTextStyle() => const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  fontFamily: "Montserrat",
);

