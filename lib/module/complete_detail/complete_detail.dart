import 'package:ex2/common/widget/primary_button.dart';
import 'package:ex2/common/widget/primary_textfield.dart';
import 'package:ex2/module/input_card_details/input_card_details.dart';
import 'package:ex2/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CompleteDetail extends StatefulWidget {
  State<CompleteDetail> createState() => _CompleteDetailState();
}

class _CompleteDetailState extends State<CompleteDetail> {
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      height: 450,
      child: Column(
        children: [
          SizedBox(height: 30),
          Text(
            "Delivery address",
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          PrimaryTextfield(hint: "10th avenue, Lekki, Lagos State"),
          SizedBox(height: 20),
          Text(
            "Number we can call",
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          PrimaryTextfield(hint: "09090605708"),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PrimaryButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/success');
                },
                width: 150,
                textButton: "Pay on delivery",
                color: Colors.white,
                textColor: AppColors.primaryOrange,
              ),
              PrimaryButton(
                onPressed: () {
                  Navigator.pop(context);
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return InputCardDetails();
                    },
                  );
                },
                width: 150,
                textButton: "Pay on card",
                color: Colors.white,
                textColor: AppColors.primaryOrange,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
