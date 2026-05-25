import 'package:flutter/material.dart';

const primaryColor = Color(0xFF6C63FF);
const secondaryColor = Color(0xFF8E97FD);
const darkBackground = Color(0xFF111827);
const cardColor = Color(0xFF1F2937);

ThemeData appTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: darkBackground,
  fontFamily: 'Poppins',

  colorScheme: ColorScheme.dark(
    primary: primaryColor,
    secondary: secondaryColor,
  ),

  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    foregroundColor: Colors.white,
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: cardColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 18,
    ),
    labelStyle: const TextStyle(color: Colors.white70),
  ),
);