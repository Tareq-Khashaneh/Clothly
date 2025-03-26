import 'package:clothly/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    iconTheme: const IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: AppColors.kMainColorBlack,
      secondary: AppColors.kMainColorBlack2,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(

      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, // This ensures text color is white
          backgroundColor: AppColors.kMainColorBlack,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          textStyle: const TextStyle(fontSize: 16)),
    ),

    fontFamily: 'Encode_Sans',
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.kMainColorBlack,
      iconTheme: const IconThemeData(color: Colors.white)
    ),
  );

  // static final darkTheme = ThemeData(
  //   brightness: Brightness.dark,
  //   primarySwatch: Colors.blue,
  //   scaffoldBackgroundColor: Colors.black,
  //   // Add other dark theme customizations
  // );
}
