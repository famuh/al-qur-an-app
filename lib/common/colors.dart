import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color appPurple = const Color(0xFF431AA1);
Color appPurpleDark = const Color(0xFF260F68);
Color appWhite = const Color(0xFFFAF8FC);
Color appPurpleLight = const Color(0xFF9345F2);
Color appOrange = const Color(0xFFE6704A);

ThemeData appLight = ThemeData(
    primaryColor: appPurple,
    // scaffoldBackgroundColor: appWhite,
    appBarTheme: AppBarTheme(backgroundColor: appPurple));

ThemeData appDark = ThemeData(
    primaryColor: appPurple,
    scaffoldBackgroundColor: appPurpleDark,
    appBarTheme: AppBarTheme(backgroundColor: appPurpleDark),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: appWhite
      ),
      bodyMedium: TextStyle(
        color: appWhite
      )
    )
    );
