import 'package:bottom/main.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData.light();

ThemeData darkTheme = ThemeData.dark();

ThemeData dark = ThemeData().copyWith(
    colorScheme: kColorScheme,
    brightness: Brightness.dark,
    useMaterial3: true,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: Colors.black,
      foregroundColor: kColorScheme.primaryContainer,
    ),
    drawerTheme:
        ThemeData().drawerTheme.copyWith(backgroundColor: Colors.black),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kColorScheme.primaryContainer,
      ),
    ),
    timePickerTheme: ThemeData().timePickerTheme.copyWith(
          dialBackgroundColor: kColorScheme.primaryContainer,
          hourMinuteTextStyle: TextStyle(fontSize: 50),
          backgroundColor: Colors.white,
        ),
    iconTheme: ThemeData().iconTheme.copyWith(
          color: Colors.white,
          size: 35,
        ),
    primaryColor: Colors.grey[200],
    scaffoldBackgroundColor: Colors.black);

ThemeData light = ThemeData().copyWith(
    primaryColor: Colors.grey[400],
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: kColorScheme,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
    dialogTheme:
        ThemeData().dialogTheme.copyWith(backgroundColor: Colors.white),
    timePickerTheme: ThemeData().timePickerTheme.copyWith(
          dialBackgroundColor: kColorScheme.primaryContainer,
          hourMinuteTextStyle: TextStyle(fontSize: 50),
          backgroundColor: Colors.white,
        ),
    drawerTheme:
        ThemeData().drawerTheme.copyWith(backgroundColor: Colors.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kColorScheme.primaryContainer,
      ),
    ),
    iconTheme: ThemeData().iconTheme.copyWith(
          color: const Color.fromRGBO(0, 0, 0, 1),
          size: 35,
        ),
    scaffoldBackgroundColor: Colors.white);
