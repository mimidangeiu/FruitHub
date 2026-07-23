import 'package:ex2/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryTextfield extends StatelessWidget {
  final String hint;
  final Widget? icon;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  PrimaryTextfield({
    required this.hint,
    this.icon,
    this.controller,
    this.onChanged,
  });

  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: theme.textTheme.bodyMedium,
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
