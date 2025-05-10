import 'package:cosine/theme/text_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    fontFamily: 'Inter',
    fontFamilyFallback: const ['Roboto'],
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF3395FF), // Button color
      onPrimary: Color(0xFFFFFFFF), // Main button text color
      secondary: Color(0xFFFFA100), // Not used in build but icon color
      onSecondary: Color(0xFFFFFFFF), // Not in use
      error: Color(0xFFFF3B30), // Error
      onError: Color(0xFFFFFFFF), // Not in use
      surface: Color(0xFFFFFFFF), // Scaffold background color
      onSurface: Color(0xFF111111), // Headline text color
      primaryContainer: Color(0xFFE5E5E5), // Container to group data together
      secondaryContainer: Color(0xFF0E0E1A), // Background for bottom sheets
      onSecondaryFixed: Color(0xFF333333), // Body text color
      onSecondaryContainer:
          Color(0xFFFFFFFF), // Background for containers in Bottom Sheets
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 48,
        height: 1.5,
        fontWeight: CustomFontWeight.bold,
        color: Color(0xFF111111),
      ),
      titleMedium: TextStyle(
        fontSize: 40,
        height: 1.5,
        fontWeight: CustomFontWeight.bold,
        color: Color(0xFF111111),
      ),
      titleSmall: TextStyle(
        fontSize: 32,
        height: 1.5,
        fontWeight: CustomFontWeight.bold,
        color: Color(0xFF111111),
      ),
      headlineLarge: TextStyle(
        fontSize: 28,
        height: 1.5,
        fontWeight: CustomFontWeight.bold,
        color: Color(0xFF111111),
      ),
      headlineMedium: TextStyle(
        fontSize: 22,
        height: 1.5,
        fontWeight: CustomFontWeight.semiBold,
        color: Color(0xFF111111),
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        height: 1.5,
        fontWeight: CustomFontWeight.semiBold,
        color: Color(0xFF111111),
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: CustomFontWeight.medium,
        color: Color(0xFF333333),
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: CustomFontWeight.medium,
        color: Color(0xFF333333),
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: CustomFontWeight.medium,
        color: Color(0xFF333333),
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: CustomFontWeight.medium,
        color: Color(0xFF333333),
      ),
    ),
    visualDensity: VisualDensity.compact,
    useMaterial3: true,
  );

  static ThemeData darkMode = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF000000),
    fontFamily: 'Inter',
    fontFamilyFallback: const ['Roboto'],
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF3395FF), // Button color
      onPrimary: Color(0xFFFFFFFF), // Main button text color
      secondary: Color(0xFFFFA100), // Not used in build but icon color
      onSecondary: Color(0xFFFFFFFF), // Not in use
      error: Color(0xFFFF3B30), // Error
      onError: Color(0xFFFFFFFF), // Not in use
      surface: Color(0xFF000000), // Scaffold background color
      onSurface: Color(0xFFFFFFFF), // Headline text color
      primaryContainer: Color(0xFF1A1A1A), // Container to group data together
      secondaryContainer: Color(0xFFFFFFFF), // Background for bottom sheets
      onSecondaryFixed: Color(0xFFE3E3E3), // Body text color
      onSecondaryContainer:
          Color(0xFF000000), // Background for containers in Bottom Sheets
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 48,
        height: 1.5,
        fontWeight: CustomFontWeight.bold,
        color: Color(0xFFFFFFFF),
      ),
      titleMedium: TextStyle(
        fontSize: 40,
        height: 1.5,
        fontWeight: CustomFontWeight.bold,
        color: Color(0xFFFFFFFF),
      ),
      titleSmall: TextStyle(
        fontSize: 32,
        height: 1.5,
        fontWeight: CustomFontWeight.bold,
        color: Color(0xFFFFFFFF),
      ),
      headlineLarge: TextStyle(
        fontSize: 28,
        height: 1.5,
        fontWeight: CustomFontWeight.bold,
        color: Color(0xFFFFFFFF),
      ),
      headlineMedium: TextStyle(
        fontSize: 22,
        height: 1.5,
        fontWeight: CustomFontWeight.semiBold,
        color: Color(0xFFFFFFFF),
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        height: 1.5,
        fontWeight: CustomFontWeight.semiBold,
        color: Color(0xFFFFFFFF),
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: CustomFontWeight.medium,
        color: Color(0xFFE3E3E3),
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: CustomFontWeight.medium,
        color: Color(0xFFE3E3E3),
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: CustomFontWeight.medium,
        color: Color(0xFFE3E3E3),
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: CustomFontWeight.medium,
        color: Color(0xFFE3E3E3),
      ),
    ),
    visualDensity: VisualDensity.compact,
    useMaterial3: true,
  );
}
