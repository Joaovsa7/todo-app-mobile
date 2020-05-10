import 'package:flutter/material.dart';
import 'package:todo_app/services/sharedPref.dart';

Map<String, ThemeData> themes = {
  'morning': ThemeData(
    bottomAppBarTheme: BottomAppBarTheme(
      color: Colors.orange[400],
    ),
    bottomAppBarColor: Colors.black,
    brightness: Brightness.light,
    primaryColor: Colors.orange[400],
    accentColor: Colors.cyan[600],
    textTheme: TextTheme(
      body1: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
  'evening': ThemeData(
    bottomAppBarTheme: BottomAppBarTheme(
      color: Colors.orange[400],
    ),
    bottomAppBarColor: Colors.black,
    brightness: Brightness.light,
    primaryColor: Colors.orange[400],
    accentColor: Colors.cyan[600],
    primaryTextTheme: TextTheme(
      body1: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
  'night': ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    accentColor: Colors.blue,
    bottomAppBarColor: Colors.blue,
    textTheme: TextTheme(
      headline: TextStyle(
        fontSize: 72.0,
        fontWeight: FontWeight.bold,
      ),
      title: TextStyle(
        fontSize: 36.0,
        fontStyle: FontStyle.italic,
      ),
      button: TextStyle(
        color: Colors.white,
      ),
      body1: TextStyle(
        fontSize: 14.0,
      ),
    ),
  ),
};

ThemeData defineTheme([String theme]) {
  if (theme != null) {
    final requestedTheme = themes[theme];
    if (requestedTheme != null) {
      return requestedTheme;
    }

    return themes['night'];
  }

  int hour = DateTime.now().hour;
  bool isMorning = hour > 6 && hour < 12;
  bool isEvening = hour >= 12 && hour < 18;
  bool isNight = hour >= 18 && !isMorning;

  if (isEvening) {
    return themes['evening'];
  }

  if (isNight) {
    return themes['night'];
  }

  return themes['morning'];
}
