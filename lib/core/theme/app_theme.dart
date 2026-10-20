import 'package:flutter/material.dart';
import 'package:vibezone/core/configs/constants/constant.dart';

ThemeData themeData(BuildContext context, Brightness brightness) {
  final isDark = brightness == Brightness.dark;
  final bgColor = isDark ? background : const Color(0xFFFFFFFF);

  return ThemeData(
    fontFamily: 'SF-Pro-Display',
    brightness: brightness,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFA8D64A),
      brightness: brightness,
      primary: const Color(0xFFA8D64A),
      error: const Color(0xFFE21221).withValues(alpha: 0.7),
    ),
    useMaterial3: true,
    textTheme: textTheme(isDark: isDark),
    dividerTheme: DividerThemeData(
      color: isDark ? const Color(0xFF333333) : const Color(0xFFEEEEEE),
    ),
    scaffoldBackgroundColor: bgColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: bgColor,
      selectedItemColor: const Color(0xFFA8D64A),
      unselectedItemColor: Color(0xff9E9E9E),
      unselectedLabelStyle: Theme.of(
        context,
      ).textTheme.titleMedium!.copyWith(color: Color(0xff9E9E9E), fontSize: 10),
      selectedLabelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
        color: const Color(0xFFA8D64A),
        fontSize: 10,
      ),
    ),
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: bgColor,
      titleTextStyle: textTheme(isDark: isDark).titleLarge,
    ),
    inputDecorationTheme: inputDecorationTheme(),
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    filled: true,
    hintStyle: const TextStyle(
      fontSize: 14,
      color: Color(0xFF8F8D8D),
      fontWeight: FontWeight.normal,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.only(
      left: 16,
      top: 12,
      bottom: 12,
      right: 48,
    ),
  );
}

TextTheme textTheme({bool isDark = false}) {
  final baseColor = isDark ? Colors.white : Colors.black;
  final bodyColor = isDark ? Colors.white70 : Colors.black87;
  final subColor = isDark ? Colors.white54 : Colors.black54;

  return TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: baseColor,
    ),
    displayMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: baseColor,
    ),
    displaySmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: baseColor,
    ),

    // Body text styles
    bodyLarge: TextStyle(fontSize: 16, color: bodyColor, height: 1.5),
    bodyMedium: TextStyle(fontSize: 14, color: bodyColor, height: 1.5),
    bodySmall: TextStyle(fontSize: 12, color: subColor, height: 1.5),

    // Title styles
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: baseColor,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: baseColor,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: baseColor,
    ),

    // Label styles
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
    ),
  );
}

/*
InputDecorationTheme inputDecorationTheme({required bool isDark}) {
  return InputDecorationTheme(
    filled: true,
    fillColor: isDark ? const Color(0xFF1A1A1A) : const Color(0xFFF5F5F5),
    hintStyle: TextStyle(
      fontSize: 14,
      color: isDark ? const Color(0xFFBDBDBD) : const Color(0xFF8F8D8D),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.only(
      left: 16,
      top: 14,
      bottom: 14,
      right: 48,
    ),
  );
}

TextTheme textTheme({required bool isDark}) {
  final baseColor = isDark ? Colors.white : Colors.black;
  final secondary = isDark ? Colors.white70 : Colors.black87;
  final tertiary = isDark ? Colors.white54 : Colors.black54;

  return TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: baseColor,
    ),
    displayMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: baseColor,
    ),
    displaySmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: baseColor,
    ),
    bodyLarge: TextStyle(fontSize: 16, color: secondary, height: 1.5),
    bodyMedium: TextStyle(fontSize: 14, color: secondary, height: 1.5),
    bodySmall: TextStyle(fontSize: 12, color: tertiary, height: 1.5),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: baseColor,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: baseColor,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: baseColor,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      color: baseColor,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      color: baseColor,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      color: baseColor,
    ),
  );
}


ThemeData themeData(BuildContext context, Brightness brightness) {
  final isDark = brightness == Brightness.dark;

  return ThemeData(
    fontFamily: 'koHo',
    useMaterial3: true,
    brightness: brightness,
    scaffoldBackgroundColor: isDark ? const Color(0xFF0D0D0D) : Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFA8D64A),
      brightness: brightness,
    ),
    textTheme: textTheme(isDark: isDark),
    dividerTheme: DividerThemeData(
      color: isDark ? const Color(0xFF333333) : const Color(0xFFEEEEEE),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: isDark ? const Color(0xFF0D0D0D) : Colors.white,
      selectedItemColor: const Color(0xFFA8D64A),
      unselectedItemColor: const Color(0xff9E9E9E),
      unselectedLabelStyle: textTheme(isDark: isDark).titleMedium!.copyWith(
        color: const Color(0xff9E9E9E),
        fontSize: 10,
      ),
      selectedLabelStyle: textTheme(isDark: isDark).titleMedium!.copyWith(
        color: const Color(0xFFA8D64A),
        fontSize: 10,
      ),
    ),
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: isDark
          ? const Color(0xFF0D0D0D).withOpacity(0.5)
          : Colors.white.withOpacity(0.9),
      titleTextStyle: textTheme(isDark: isDark).titleLarge,
      iconTheme: IconThemeData(
        color: isDark ? Colors.white : Colors.black,
      ),
    ),
    inputDecorationTheme: inputDecorationTheme(isDark: isDark),
  );
}
*/
