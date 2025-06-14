import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/theme/text_theme.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.red,
    scaffoldBackgroundColor: Colors.white,
   colorScheme: ColorScheme.light(
    primary: Colors.red,
    onPrimary: Colors.white,
    secondary: Colors.blue,
    onSecondary: Colors.white,
    surface: Colors.grey.shade300, // ✅ Container color
    onSurface: Colors.black,
    background: Colors.white,
    onBackground: Colors.black,
    error: Colors.red,
    onError: Colors.white,
  ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
    ),
    textTheme: customTextTheme(Colors.black)
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.red,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.dark(
    primary: Colors.red,
    onPrimary: Colors.black,
    secondary: Colors.teal,
    onSecondary: Colors.black,
    surface: Colors.grey.shade800,
    onSurface: Colors.white,
    background: Colors.black,
    onBackground: Colors.white,
    error: Colors.red.shade400,
    onError: Colors.black,
  ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
    ),
    textTheme: customTextTheme(Colors.white)
  );
}
