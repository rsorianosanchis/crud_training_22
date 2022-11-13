import 'package:flutter/material.dart';

class CustomTheme {

  static ButtonStyle customButtonLoginReg = ButtonStyle(
    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
    overlayColor: MaterialStateProperty.all(Colors.deepPurple[300]!.withOpacity(0.3)),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0)),)
  );

  static ThemeData customTheme = ThemeData.light().copyWith(
 
    

    scaffoldBackgroundColor: Colors.blueGrey[100],
    appBarTheme: const AppBarTheme(
      color: Colors.indigo,
      elevation: 0
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.indigo,
      elevation: 0
    )
  );

}