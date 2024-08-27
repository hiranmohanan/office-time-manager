import 'package:flutter/material.dart';

ThemeData darktheme() {
  return ThemeData(
    primaryColor: Colors.black,
    hintColor: Colors.white,
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 72.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 36.0,
        fontStyle: FontStyle.italic,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        fontFamily: 'Hind',
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      labelLarge: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    primarySwatch: Colors.blue,
    inputDecorationTheme: InputDecorationTheme(
      border: InputBorder.none,
      fillColor: Colors.grey[200],
      filled: true,
      hintStyle: TextStyle(
        color: Colors.grey[400],
      ),
    ),
    cardTheme: CardTheme(
      elevation: 2,
      color: Colors.grey[100],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        ),
        backgroundColor: const WidgetStatePropertyAll(Colors.white),
        elevation: const WidgetStatePropertyAll(2),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        textStyle: const WidgetStatePropertyAll(
          TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
              fontStyle: FontStyle.normal),
        ),
      ),
    ),
  );
}
