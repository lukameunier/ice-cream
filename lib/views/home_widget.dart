import 'package:flutter/material.dart';
import 'package:icecream/views/flavours_widget.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ice cream"),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Scoop flavours"),
                Text("maximum 5"),
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                FlavoursWidget(),
                FlavoursWidget(),
                FlavoursWidget(),
                FlavoursWidget(),
                FlavoursWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
