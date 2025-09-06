import 'package:flutter/material.dart';
import 'package:task1/pages/colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: kprimarycolor,
  scaffoldBackgroundColor: kLightbackground,
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: kLightcard,
    hintStyle: TextStyle(color: klightHint),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.grey),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kprimarycolor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStatePropertyAll(kAccentcolor),
  ),
  textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black)),
);

final ThemeData darktheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: kprimarycolor,
  scaffoldBackgroundColor: kDarkBackground,
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: kDarkCard,
    hintStyle: TextStyle(color: kDarkHint),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.grey),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kprimarycolor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStatePropertyAll(kAccentcolor),
  ),
  textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
);
