import 'package:flutter/material.dart';
import 'package:ex2/theme/app_theme.dart';

class GobackButton extends StatelessWidget {
  final String navigator;

  GobackButton({required this.navigator});
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 0, 30),
      child: IconButton(
        style: IconButton.styleFrom(backgroundColor: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, navigator);
        },
        icon: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/goback_icon.png'),
            SizedBox(width: 5),
            Text("Go back", style: theme.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
