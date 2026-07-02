import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final Widget child;

  AppContainer({required this.child});

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      constraints: BoxConstraints.expand(),
      child: child,
    );
  }
}
