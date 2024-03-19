import 'package:flutter/material.dart';

import 'colors.dart';

class AppStyles {
  static final primaryButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(AppColors.primaryDarkBlue),
    foregroundColor: MaterialStateProperty.all(AppColors.buttonFgColor),
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 16.0,
      ),
    ),
    shape: MaterialStateProperty.all(
      BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(2.8),
      ),
    ),
  );
}
