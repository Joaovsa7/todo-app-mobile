import 'package:flutter/material.dart';

ThemeData defineTheme() {
  int hour = DateTime.now().hour;
  bool isMorning = hour >= 6 && hour < 12;
  bool isEvening = hour >= 12 && hour < 18;
  bool isNight = hour >= 18 && hour < 6;

  if (isEvening) {
    return ThemeData(
      bottomAppBarTheme: BottomAppBarTheme(
        color: Colors.orange[400],
      ),
      bottomAppBarColor: Colors.black,
      brightness: Brightness.light,
      primaryColor: Colors.orange[400],
      accentColor: Colors.cyan[600],
      primaryTextTheme: TextTheme(body1: TextStyle(color: Colors.white)),
    );
  }
}
