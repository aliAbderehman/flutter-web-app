import 'package:flutter/material.dart';

RoundedRectangleBorder radius =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));

// Light mode theme
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: Color.fromARGB(255, 226, 226, 226),
    secondary: Color.fromARGB(255, 198, 242, 255),
    tertiary: Color(0xff00D3FF),
    primaryContainer: Color(0xff0B394E),
    secondaryContainer: Color.fromARGB(255, 226, 226, 226),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          shape: radius,
          side: const BorderSide(
            color: Color(0xff00D3FF),
          ))),
  textTheme: const TextTheme(
    displaySmall: TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontSize: 25,
      fontFamily: 'MetropolisReg',
      fontWeight: FontWeight.normal,
    ),
    displayLarge: TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontSize: 55,
      fontFamily: 'Metropolis',
    ),
    displayMedium: TextStyle(
      color: Color(0xFF94EBFC),
      fontSize: 20,
      fontFamily: 'Metropolis',
    ),
    labelMedium:
        TextStyle(fontSize: 20, color: Color.fromARGB(255, 162, 162, 162)),
    // bodySmall: TextStyle(
    //   fontFamily: 'MetropolisReg',
    //   fontSize: 25,
    //   color: Color(0xff114052),
    // ),
    bodyMedium: TextStyle(
      color: Color(0xff114052),
      fontFamily: 'MetropolisReg',
      fontSize: 25,
    ),
    bodyLarge: TextStyle(
      fontSize: 25,
      color: Color(0xFF084C61),
    ),
  ),
  cardTheme: const CardTheme(
    color: Color(0xff114052),
  ),
);

// Dark mode theme
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: Color(0xff1E1E24),
    secondary: Color(0xffCBCBCB),
    tertiary: Color(0xffF8C30C),
    primaryContainer: Color(0xff1E1E24),
    secondaryContainer: Color.fromARGB(255, 42, 42, 43),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          shape: radius,
          side: const BorderSide(
            color: Color(0xffF8C30C),
          ))),
  textTheme: const TextTheme(
    displaySmall: TextStyle(
      color: Color(0xFFB9CCD0),
      fontSize: 25,
      fontFamily: 'MetropolisReg',
      fontWeight: FontWeight.normal,
    ),
    labelMedium:
        TextStyle(fontSize: 20, color: Color.fromARGB(255, 162, 162, 162)),
    displayLarge: TextStyle(
      color: Color(0xFFB9CCD0),
      fontSize: 55,
      fontFamily: 'Metropolis',
    ),
    displayMedium: TextStyle(
      color: Color(0xFFB9CCD0),
      fontSize: 20,
      fontFamily: 'Metropolis',
    ),
    bodyMedium: TextStyle(
      fontFamily: 'MetropolisReg',
      fontSize: 25,
      color: Color(0xFFB9CCD0),
    ),
    bodyLarge: TextStyle(
      fontSize: 25,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
  ),
  cardTheme: const CardTheme(
    color: Color(0xff12161c),
  ),
);
