// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:lixtec/app/presentation/shared/theme/app_colors.dart';
import 'package:lixtec/app/presentation/shared/theme/app_text_style.dart';

class AppTheme {
  static const MaterialColor _primarySwatch = MaterialColor(0xFFa7c957, {
    50: Color(0xFFa7c957),
    100: Color(0xFFa7c957),
    200: Color(0xFFa7c957),
    300: Color(0xFFa7c957),
    400: Color(0xFFa7c957),
    500: Color(0xFFa7c957),
    600: Color(0xFFa7c957),
    700: Color(0xFFa7c957),
    800: Color(0xFFa7c957),
    900: Color(0xFFa7c957),
  });

  static final ThemeData themeData = ThemeData(
    primarySwatch: _primarySwatch,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.darkColor,
    textTheme: AppTextStyles.textTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    ),
    cupertinoOverrideTheme: const CupertinoThemeData(),
    brightness: Brightness.light,
    canvasColor: AppColors.primaryColor,
    cardTheme: const CardTheme(
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.all(0),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.inputFillColor,
      hintStyle: const TextStyle(
        color: AppColors.inputLabelColor,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.inputFillColor),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.inputFillColor),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.inputFillColor),
        borderRadius: BorderRadius.circular(10),
      ),
      errorStyle: AppTextStyles.textTheme.headlineSmall!.apply(
        color: AppColors.dangerColor,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
    ),
  );
}
