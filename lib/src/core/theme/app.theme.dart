import 'package:flutter/material.dart';
import 'package:spotiflutter/src/core/theme/app_colors.theme.dart';
import 'package:spotiflutter/src/core/theme/app_font_family.theme.dart';

class AppTheme {
  AppTheme._();

  static AppColorsTheme get colors => AppColorsTheme();

  static AppFontFamily get fontFamily => AppFontFamily();

  static ThemeData get defaultTheme => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppTheme.colors.black,
        primaryColor: AppTheme.colors.primary,
        fontFamily: AppTheme.fontFamily.regular,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppTheme.colors.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: AppTheme.colors.black,
            backgroundColor: AppTheme.colors.primary,
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: AppTheme.fontFamily.bold,
            ),
            disabledForegroundColor: AppTheme.colors.primary.withOpacity(0.5),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          errorStyle: TextStyle(
            fontSize: 12,
            color: Colors.red.shade400,
          ),
          //border: _border(Colors.red.shade400),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          focusedBorder:const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          contentPadding: const EdgeInsets.all(15),
          hintStyle: const TextStyle(
            color: Colors.white54,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}
