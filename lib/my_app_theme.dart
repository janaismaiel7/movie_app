 import 'package:flutter/material.dart';
import 'package:movies_app/my_app_colors.dart';

class MyAppTheme{
  static ThemeData appTheme= ThemeData(
    primaryColor: MyAppColors.primaryColor ,
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 18 ,
        color: MyAppColors.whiteColor ,
      ),
      bodyMedium: TextStyle(
        fontSize: 14 ,
        color: MyAppColors.whiteColor ,
      ),
      titleLarge: TextStyle(
        fontSize: 20 ,
        fontWeight: FontWeight.bold,
        color: MyAppColors.whiteColor ,
      ),
    ) ,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedIconTheme: IconThemeData(
        color: MyAppColors.primaryColor ,
        size: 50
      ) ,
      unselectedIconTheme: IconThemeData(
        color: MyAppColors.lightGreyColor,
        size: 40
      )
    )

  );
 }