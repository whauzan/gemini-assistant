import 'package:flutter/material.dart';
import 'package:gemini_assistant/core/configs/theme/app_colors.dart';

class FontSizes {
  static const extraSmall = 14.0;
  static const small = 16.0;
  static const standard = 18.0;
  static const large = 20.0;
  static const extraLarge = 24.0;
  static const doubleExtraLarge = 26.0;
}

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    shadowColor: Colors.white,
  ),
  colorScheme: const ColorScheme.light(
      surface: AppColors.lightBackground,
      primary: AppColors.primary,
      secondary: AppColors.secondary
  ),
  inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.blue)
  ),
  textTheme: const TextTheme(
      titleLarge: TextStyle(color: AppColors.darkBackground,),
      titleSmall: TextStyle(
        color: AppColors.darkBackground,
      ),
      bodyMedium: TextStyle(
          color: AppColors.secondary,
          fontSize: FontSizes.small
      ),
      bodySmall: TextStyle(
          color: AppColors.darkBackground,
          fontSize: FontSizes.small
      )
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    shadowColor: AppColors.shadow,
  ),
  colorScheme: const ColorScheme.dark(
      surface: AppColors.darkBackground,
      primary: AppColors.primary,
      secondary: AppColors.secondary
  ),
  textTheme: const TextTheme(
      titleLarge: TextStyle(color: AppColors.secondary,),
      titleSmall: TextStyle(
        color: AppColors.darkBackground,
      ),
      bodyMedium: TextStyle(
          color: AppColors.secondary,
          fontSize: FontSizes.small
      ),
      bodySmall: TextStyle(
          color: AppColors.darkBackground,
          fontSize: FontSizes.small
      )
  ),
);