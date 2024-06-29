import 'package:flutter/material.dart';

const black = Color.fromRGBO(26, 26, 26, 1);
const col_blue = Color.fromRGBO(185, 217, 235, 1);
const saphire = Color.fromRGBO(15, 82, 186, 1);
const royalblue = Color.fromRGBO(0, 35, 102, 1);

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        background: Colors.yellow.shade200,
        primary: Colors.yellow,
        secondary: Colors.green));

ThemeData DarkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: Color.fromRGBO(0, 0, 0, 1),
      primary: Color.fromRGBO(52, 73, 102, 1),
      secondary: Color.fromRGBO(180, 205, 237, 1),
    ));
