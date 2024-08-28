import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color appPurple = const Color(0xFF431AA1);
Color appPurpleDark = const Color(0xFF260F68);
Color appWhite = const Color(0xFFFAF8FC);
Color appPurpleLight1 = const Color(0xFF9345F2);
Color appPurpleLight2 = const Color(0xFFD2BEE8);
Color appOrange = const Color(0xFFE6704A);

ThemeData themeLight = ThemeData(
    primaryColor: appPurple,
    scaffoldBackgroundColor: appWhite,
    appBarTheme: AppBarTheme(backgroundColor: appWhite,
    titleTextStyle: TextStyle(
      color: appPurpleLight1,
      fontSize: 18,
      fontWeight: FontWeight.w500
    )),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: appPurpleDark
      ),
      bodyMedium: TextStyle(
        color: appPurpleDark
      )
    )
    );

ThemeData appDark = ThemeData(
    primaryColor: appPurpleLight2,
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
