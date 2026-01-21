import 'package:flutter/material.dart';
import 'package:scube/app/core/constants/app_colors.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.background,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    surface: AppColors.white,
    onPrimary: AppColors.white,
    onSecondary: AppColors.text,
    onSurface: AppColors.text,
    outline: AppColors.border,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.background,
    centerTitle: true,
    elevation: 0,
    scrolledUnderElevation: 0,
    iconTheme: IconThemeData(color: AppColors.text),
  ),
  /* cardTheme: const CardTheme(
    color: AppColors.white,
    elevation: 2,
    margin: EdgeInsets.zero,
  ), */
  dividerTheme: const DividerThemeData(color: AppColors.border, thickness: 1),
);
