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
            Expanded(child:
              Text(
                "Ice cream",
                style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1),
              )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Scoop flavours"),
                FlavoursWidget()
              ],
            ),
          ],
        ),
      ),
    );
  }
}