import 'package:flutter/material.dart';
import 'package:ex2/theme/app_colors.dart';

class AppStack extends StatelessWidget {
  final Widget hero;
  final Widget body;

  AppStack({required this.hero, required this.body});

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(color: AppColors.primaryOrange),
              Center(child: hero),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
          color: Colors.white,
          height: 350,
          child: body,
        ),
      ],
    );
  }
}
