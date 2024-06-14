// ignore_for_file: deprecated_member_use, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'colors.dart';

class ThemeDataApp {
  //get theme according to an app brightness
  static ThemeData getTheme(BuildContext context) {
    return (MediaQuery.of(context).platformBrightness == Brightness.dark)
        ? ThemeDataApp.ThemeDataDark()
        : ThemeDataApp.ThemeDataLight();
  }

  //get background color according to theme
  Color getBackgroundColor(BuildContext context) {
    return (MediaQuery.of(context).platformBrightness == Brightness.dark)
        ? kColorDark
        : kWhiteColor;
  }

  //texttheme for light brightness mode
  static TextTheme lightTextTheme = const TextTheme(
    bodyLarge: TextStyle(color: Colors.black, fontSize: 14),
  );

  //texttheme for dark brightness mode
  static TextTheme darkTextTheme =
      const TextTheme(bodyLarge: TextStyle(color: Colors.white, fontSize: 14));

  //dark theme
  static ThemeDataDark() {
    return ThemeData(
      primaryColor: primaryColorDark,
      primarySwatch: primaryColorDark,
      brightness: Brightness.dark,
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: kWhiteColor,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: kColorDark,
        elevation: 0,
        iconTheme: IconThemeData(
          color: primaryColorDark,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(foregroundColor: textFormFieldColor),
      ),
      textTheme: darkTextTheme,
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          foregroundColor: primaryColorDark,
          backgroundColor: kWhiteColor,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: primaryColorDark, width: 1),
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        unselectedItemColor: kGrey,
        selectedItemColor: primaryColorDark,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColorDark,
      ),
    );
  }

  //light theme
  static ThemeDataLight() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: lightGreen),
      primaryColor: primaryColorWhite,
      primarySwatch: primaryColorWhite,
      // brightness: Brightness.light,
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: kWhiteColor,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: kWhiteColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: primaryColorWhite,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(foregroundColor: textFormFieldColor),
      ),
      textTheme: lightTextTheme,
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          foregroundColor: primaryColorWhite,
          backgroundColor: kWhiteColor,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: primaryColorWhite, width: 1),
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        unselectedItemColor: kWhiteColor,
        selectedItemColor: primaryColorWhite,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColorWhite,
      ),
    );
  }
}
