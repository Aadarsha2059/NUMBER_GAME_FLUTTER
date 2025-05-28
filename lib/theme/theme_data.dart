import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primarySwatch: Colors.orange,
    scaffoldBackgroundColor: Colors.grey[200],
    fontFamily: 'Opensans Bold',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 18,
          color: Colors.amber,
          fontWeight: FontWeight.w200,
          fontFamily: 'Opensans Bold',
        ),
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Colors.amber,
      elevation: 4,
      shadowColor: Colors.black,
      titleTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
