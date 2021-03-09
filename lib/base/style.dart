import 'package:flutter/material.dart';

const aquamarineColor = Color(0xFF98DBC6);
const greenColor = Color(0xFF5BC8AC);
const yellowColor = Color(0xFFE6D72A);
const pinkColor = Color(0xFFF18D9E);

final appTheme = ThemeData(
  primaryColor: aquamarineColor,
  accentColor: pinkColor,
  scaffoldBackgroundColor: Colors.transparent,
  inputDecorationTheme: InputDecorationTheme(
    errorBorder: InputBorder.none,
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    focusedErrorBorder: InputBorder.none,
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontFamily: "Alegreya",
      color: Colors.black,
    ),
    headline2: TextStyle(
      fontFamily: "Alegreya",
      color: Colors.black,
    ),
    headline3: TextStyle(
      fontFamily: "Alegreya",
      color: Colors.black,
    ),
    headline4: TextStyle(
      fontFamily: "Alegreya",
      color: Colors.black,
    ),
    headline5: TextStyle(
      fontFamily: "Alegreya",
      color: Colors.black,
    ),
    headline6: TextStyle(
      fontFamily: "Alegreya",
      color: Colors.black,
    ),
    subtitle1: TextStyle(
      fontFamily: "Arimo",
    ),
    subtitle2: TextStyle(
      fontFamily: "Arimo",
    ),
    caption: TextStyle(
      fontFamily: "Arimo",
    ),
    button: TextStyle(
      fontFamily: "Arimo",
    ),
    bodyText1: TextStyle(
      fontFamily: "Arimo",
    ),
    bodyText2: TextStyle(
      fontFamily: "Arimo",
    ),
    overline: TextStyle(
      fontFamily: "Arimo",
    ),
  ),
);
