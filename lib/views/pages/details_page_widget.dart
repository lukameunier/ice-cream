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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(flavour.name, style: TextStyle(fontSize: 35)),
              Row(
                children: [
                  Image(image: AssetImage(flavour.imagePath), height: 200),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      "${flavour.name} flavour is empty",
                      style: TextStyle(fontSize: 30),
                      maxLines: 3,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: "Signature",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: const Text("Order"),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: Text("Check all items"),
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
