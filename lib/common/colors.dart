import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color appPurple = const Color(0xFF431AA1);
Color appPurpleDark = const Color(0xFF010313);
Color appWhite = const Color(0xFFFAF8FC);
Color appPurpleLight1 = const Color(0xFF9345F2);
Color appPurpleLight2 = const Color(0xFFD2BEE8);
Color appOrange = const Color(0xFFE6704A);

ThemeData themeLight = ThemeData(
  brightness: Brightness.light,
    primaryColor: appPurple,
    scaffoldBackgroundColor: appWhite,
    appBarTheme: AppBarTheme(backgroundColor: appWhite,
     titleTextStyle: TextStyle(
      color: appOrange,
      fontSize: 18,
      fontWeight: FontWeight.w500
    ),
    actionsIconTheme: IconThemeData(
      color: appOrange
    )),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: appPurpleDark
      ),
      bodyMedium: TextStyle(
        color: appPurpleDark
      )
    ),
    listTileTheme: ListTileThemeData(
      textColor: appPurpleDark
    )
    );

ThemeData themeDark = ThemeData(
  brightness: Brightness.dark,
    primaryColor: appPurpleLight2,
    scaffoldBackgroundColor: appPurpleDark,
    appBarTheme: AppBarTheme(backgroundColor: appPurpleDark,
     titleTextStyle: TextStyle(
      color: appOrange,
      fontSize: 18,
      fontWeight: FontWeight.w500
    ),
    actionsIconTheme: IconThemeData(
      color: appOrange
    )),
  
    
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: appWhite
      ),
      bodyMedium: TextStyle(
        color: appWhite
      ),
      bodySmall: TextStyle(
        color: appWhite
      )
    ),
      listTileTheme: ListTileThemeData(
      textColor: appWhite
    )
    );
