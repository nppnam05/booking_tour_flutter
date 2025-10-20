import 'package:flutter/material.dart';
import 'app_color.dart';
import 'app_font.dart';

class AppThemes {
  AppThemes._();

  // Theme đơn giản chỉ với color và font
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,

    // Colors
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,

    // AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
      centerTitle: true,
    ),

    // Text Theme
    textTheme: TextTheme(
      displayLarge: AppFonts.text32,
      displayMedium: AppFonts.text28,
      displaySmall: AppFonts.text24,
      headlineLarge: AppFonts.text20,
      headlineMedium: AppFonts.text18,
      headlineSmall: AppFonts.text16,
      titleLarge: AppFonts.text16,
      titleMedium: AppFonts.text14,
      titleSmall: AppFonts.text12,
      bodyLarge: AppFonts.text16,
      bodyMedium: AppFonts.text14,
      bodySmall: AppFonts.text12,
      labelLarge: AppFonts.text14,
      labelMedium: AppFonts.text12,
      labelSmall: AppFonts.text12,
    ),

    // Button themes
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        textStyle: AppFonts.text16,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: AppFonts.text16,
      ),
    ),
  );
}
