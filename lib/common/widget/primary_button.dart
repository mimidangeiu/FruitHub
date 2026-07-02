import 'package:ex2/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Function() onPressed;
  final String textButton;
  final Color color;
  final Color textColor;
  final double? width;

  PrimaryButton({
    required this.onPressed,
    required this.textButton,
    required this.color,
    required this.textColor,
    this.width,
  });
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: width,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        color: color,
        onPressed: onPressed,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
          side: BorderSide(color: AppColors.primaryOrange, width: 2),
        ),

        child: Text(
          textButton,
          style: theme.textTheme.bodyMedium?.copyWith(color: textColor),
        ),
      ),
    );
  }
}
