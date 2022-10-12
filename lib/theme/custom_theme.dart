import 'package:flutter/material.dart';

class CustomTheme {

  static ThemeData customTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.blueGrey[100],
    appBarTheme: const AppBarTheme(
      color: Colors.indigo,
      elevation: 0
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.indigo,
      elevation: 0
    )
  );

}