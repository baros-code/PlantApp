import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_sizes.dart';

class AppTheme {
  const AppTheme._();

  static const String _defaultFontFamily = 'Roboto';

  static final light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    textTheme: _getTextTheme(AppColors.textPrimary),
    iconTheme: IconThemeData(color: AppColors.primary),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        textStyle: TextStyle(
          fontFamily: _defaultFontFamily,
          fontWeight: FontWeight.w500,
          fontSize: AppFontSizes.size16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppFontSizes.size16),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: AppFontSizes.size20,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.primary,
    ),
    searchBarTheme: SearchBarThemeData(
      backgroundColor: WidgetStatePropertyAll(AppColors.white),
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: AppColors.background),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
    ),
    cardTheme: CardThemeData(color: AppColors.white),
  );

  static final dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.black,
    textTheme: _getTextTheme(AppColors.textTertiary),
    iconTheme: IconThemeData(color: AppColors.primary),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        textStyle: TextStyle(
          fontFamily: _defaultFontFamily,
          fontWeight: FontWeight.w500,
          fontSize: AppFontSizes.size16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppFontSizes.size16),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: AppFontSizes.size20,
        fontWeight: FontWeight.w600,
        color: AppColors.textTertiary,
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.primary,
    ),
    searchBarTheme: SearchBarThemeData(
      backgroundColor: WidgetStatePropertyAll(AppColors.white),
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: AppColors.primary),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
    ),
    cardTheme: CardThemeData(color: AppColors.black),
  );

  static TextTheme _getTextTheme(Color textColor) => TextTheme(
    // Headline styles
    headlineLarge: TextStyle().copyWith(
      fontSize: AppFontSizes.size28,
      fontWeight: FontWeight.w400,
      color: textColor,
    ),
    headlineMedium: TextStyle().copyWith(
      height: AppHeights.h28 / AppFontSizes.size24,
      fontSize: AppFontSizes.size24,
      fontWeight: FontWeight.w500,
      color: textColor,
    ),
    headlineSmall: TextStyle().copyWith(
      height: AppHeights.h24 / AppFontSizes.size20,
      fontSize: AppFontSizes.size20,
      fontWeight: FontWeight.w500,
      color: textColor,
    ),
    // Title styles
    titleLarge: TextStyle().copyWith(
      fontSize: AppFontSizes.size16,
      fontWeight: FontWeight.w600,
      color: textColor,
    ),
    titleMedium: TextStyle().copyWith(
      height: AppHeights.h21 / AppFontSizes.size16,
      fontSize: AppFontSizes.size16,
      fontWeight: FontWeight.w500,
      color: textColor,
    ),
    titleSmall: TextStyle().copyWith(
      height: 1,
      fontSize: AppFontSizes.size16,
      fontWeight: FontWeight.w400,
      color: textColor,
    ),
    // Button styles
    displayMedium: TextStyle().copyWith(
      height: AppHeights.h24 / AppFontSizes.size16,
      fontSize: AppFontSizes.size16,
      fontWeight: FontWeight.w600,
      color: textColor,
    ),
    displaySmall: TextStyle().copyWith(
      height: AppHeights.h22 / AppFontSizes.size16,
      fontSize: AppFontSizes.size16,
      fontWeight: FontWeight.w400,
      color: textColor,
    ),
    // Body styles
    bodyLarge: TextStyle().copyWith(
      height: 1,
      fontSize: AppFontSizes.size15_5,
      fontWeight: FontWeight.w400,
      color: textColor,
    ),
    bodyMedium: TextStyle().copyWith(
      fontSize: AppFontSizes.size14,
      fontWeight: FontWeight.w400,
      color: textColor,
    ),
    bodySmall: TextStyle().copyWith(
      height: AppHeights.h16 / AppFontSizes.size13,
      fontSize: AppFontSizes.size13,
      fontWeight: FontWeight.w400,
      color: textColor,
    ),
    // Label styles
    labelLarge: TextStyle().copyWith(
      fontSize: AppFontSizes.size12,
      fontWeight: FontWeight.w400,
      color: textColor,
    ),
    labelMedium: TextStyle().copyWith(
      height: 1,
      fontSize: AppFontSizes.size11,
      fontWeight: FontWeight.w400,
      color: textColor.withValues(alpha: 0.5),
    ),
    labelSmall: TextStyle().copyWith(
      height: AppHeights.h15 / AppFontSizes.size11,
      fontSize: AppFontSizes.size11,
      fontWeight: FontWeight.w400,
      color: textColor,
    ),
  ).apply(fontFamily: _defaultFontFamily);
}
