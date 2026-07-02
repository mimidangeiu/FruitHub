import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const headlineLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  static const headlineMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const bodyLarge = TextStyle(fontSize: 20);
  static const bodyMedium = TextStyle(fontSize: 16);
  static const bodySmall = TextStyle(fontSize: 14);
  static const labelLarge = TextStyle(
    fontSize: 20,
    color: AppColors.placeholderText,
  );
  static const italic = TextStyle(fontSize: 16, fontStyle: FontStyle.italic);
}
