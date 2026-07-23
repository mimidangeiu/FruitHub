import 'package:ex2/common/widget/app_container.dart';
import 'package:ex2/common/widget/goback_button.dart' show GobackButton;
import 'package:flutter/material.dart';

class TrackOrder extends StatefulWidget {
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leadingWidth: 120,
        leading: GobackButton(navigator: '/home'),
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            "My Basket",
            style: theme.textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
      body: AppContainer(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    'assets/images/order_taken_image.png',
                    //fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 10),
                Text("Order Taken", style: theme.textTheme.bodyMedium),
                Spacer(),
                Image.asset(
                  'assets/icons/complete_icon.png',
                  width: 16,
                  height: 16,
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    'assets/images/order_prepared_image.png',
                    //fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  "Order Is Being Prepared",
                  style: theme.textTheme.bodyMedium,
                ),
                Spacer(),
                Image.asset(
                  'assets/icons/complete_icon.png',
                  width: 16,
                  height: 16,
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    'assets/images/deliveryman_image.png',
                    //fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Text(
                      "Order Is Being Delivered",
                      style: theme.textTheme.bodyMedium,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Your delivery agent is coming",
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
                Spacer(),
                Image.asset(
                  'assets/icons/phone_call_icon.png',
                  height: 16,
                  width: 16,
                ),
              ],
            ),
            SizedBox(height: 30),
            Image.asset('assets/images/map_image.png'),
            SizedBox(height: 30),
            Row(
              children: [
                SizedBox(
                  child: Image.asset(
                    'assets/icons/complete_icon.png',
                    height: 100,
                    width: 100,
                    //fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 20),
                Text("Order Received", style: theme.textTheme.bodyMedium),
                Spacer(),
                Image.asset('assets/icons/three_dot_icon.png'),
              ],
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
