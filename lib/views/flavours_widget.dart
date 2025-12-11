import 'package:flutter/material.dart';

import 'button_widget.dart';

class FlavoursWidget extends StatelessWidget {

  final String imagePath;
  final String flavourName;

  const FlavoursWidget({super.key, required this.imagePath, required this.flavourName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage("${"assets/"}$imagePath"),
                height: 50,
              ),
              Text(
                flavourName,
                style: TextStyle(fontSize: 20),
              ),
              const ButtonWidget(),
              Text(
                "1",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}