import 'package:flutter/material.dart';
import 'package:icecream/views/widgets/extras_widget.dart';
import 'package:icecream/views/widgets/flavours_widget.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ice cream",
                style: TextStyle(fontSize: 45),
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Scoop flavours",
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "maximum 5",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  FlavoursWidget(imagePath: "chocolate.jpg", flavourName: "Chocolate"),
                  FlavoursWidget(imagePath: "pistachio.jpg", flavourName: "Pistachio"),
                  FlavoursWidget(imagePath: "vanilla.jpg", flavourName: "Vanilla"),
                ],
              ),

              Text(
                "Cone or cup",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.start,
              ),
              Column(
                children: [

                ],
              ),

              Text(
                "Extras",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.start,
              ),
              Column(
                children: [
                  ExtrasWidget(extrasName: "Whipped cream", price: 1.00),
                  ExtrasWidget(extrasName: "Sprinkles", price: 0.50)
                ],
              ),

              const Spacer(),

              Row(
                children: [
                  Text(
                    "Price",
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.start,
                  ),
                  Expanded(child: const SizedBox()),
                  Text(
                    "2500€",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),

              const SizedBox(height: 32),

              Row(
                children: [
                  Spacer(),
                  ElevatedButton(
                    onPressed: null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: Text("Icecream so good !!!"),
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