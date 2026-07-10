import 'package:ex2/common/widget/primary_button.dart';
import 'package:ex2/common/widget/primary_textfield.dart' show PrimaryTextfield;
import 'package:ex2/theme/app_colors.dart';
import 'package:flutter/material.dart';

class InputCardDetails extends StatefulWidget {
  State<InputCardDetails> createState() => _InputCardDetailsState();
}

class _InputCardDetailsState extends State<InputCardDetails> {
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      child: Column(
        children: [
          Text(
            "Card Holders Name",
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          PrimaryTextfield(hint: "Adolphus Chris"),
          SizedBox(height: 20),
          Text(
            "Card Number",
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          PrimaryTextfield(hint: "1234 5678 9012 1314"),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Date",
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              PrimaryTextfield(hint: "10/30"),
              SizedBox(height: 20),
              Text(
                "CCV",
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              PrimaryTextfield(hint: "123"),
              SizedBox(height: 30),
            ],
          ),
          Container(
            child: PrimaryButton(
              onPressed: () {},
              textButton: 'Complete Order',
              color: AppColors.primaryOrange,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
