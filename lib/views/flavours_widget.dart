import 'package:flutter/material.dart';

import 'button_widget.dart';

class FlavoursWidget extends StatelessWidget {
  const FlavoursWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Image(
                  image: AssetImage("assets/chocolate.jpg"),
                  height: 75,
                ),
                Text("Chocolate"),
                ButtonWidget(),
                Text("Zebi")
              ],
            ),
          ],
        ),
      ),
    );
  }
}