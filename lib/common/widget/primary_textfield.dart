import 'package:ex2/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryTextfield extends StatelessWidget {
  final String hint;
  final Widget? icon;
  PrimaryTextfield({required this.hint, this.icon});

  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      decoration: InputDecoration(
        prefix: icon,
        filled: true,
        fillColor: AppColors.textField,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.textField),
        ),
        hintText: hint,
        hintStyle: theme.textTheme.bodySmall?.copyWith(
          color: AppColors.secondaryText,
        ),
      ),
    );
  }
}
