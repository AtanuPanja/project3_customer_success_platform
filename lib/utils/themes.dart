import 'package:flutter/material.dart';

import 'colors.dart';
import 'styles.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.appBgColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppStyles.primaryButtonStyle,
    ),
    brightness: Brightness.light,
  );
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.appDarkBgColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppStyles.primaryButtonStyle,
    ),
    brightness: Brightness.dark,
  );
}
