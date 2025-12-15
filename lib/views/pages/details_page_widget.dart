import 'package:flutter/material.dart';
import 'package:icecream/models/flavour.dart';

class DetailsPageWidget extends StatelessWidget {
  const DetailsPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final flavour = ModalRoute.of(context)!.settings.arguments as Flavour;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(flavour.name, style: TextStyle(fontSize: 35)),
              ],
          )
        ),
      ),
    );
  }
}