import 'package:flutter/material.dart';

class ExtrasWidget extends StatelessWidget {

  final String extrasName;
  final double price;

  const ExtrasWidget({super.key, required this.extrasName, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Checkbox(value: false, onChanged: null),
        Text(
          extrasName,
          style: TextStyle(fontSize: 20),
        ),
        Expanded(child: Spacer()),
        Text(
          "$price€",
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}