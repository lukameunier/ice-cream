import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../presenters/home_page_presenter.dart';
import 'button_widget.dart';

class FlavoursWidget extends StatelessWidget {
  final String imagePath;
  final String flavourName;
  final String flavourId;

  const FlavoursWidget({
    super.key,
    required this.imagePath,
    required this.flavourName,
    required this.flavourId,
  });

  @override
  Widget build(BuildContext context) {
    final presenter = context.watch<HomePagePresenter>();

    final double fontSize = 15;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image(image: AssetImage("assets/$imagePath"), height: 50),
              const SizedBox(width: 16),
              Expanded(
                child: Text(flavourName, style: TextStyle(fontSize: fontSize)),
              ),
              ButtonWidget(flavourId: flavourId),
              const SizedBox(width: 8),
              presenter.getAvailableScoops(flavourId) > 0
                  ? SizedBox(
                width: 40,
                child: Text(
                  presenter.getScoopCount(flavourId).toString(),
                  style: TextStyle(fontSize: fontSize),
                  textAlign: TextAlign.center,
                ),
              )
                  : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: const CircleBorder(),
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(40, 40),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/details',
                    arguments: presenter.getFlavourById(flavourId),
                  );
                },
                child: const Icon(Icons.highlight_off, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
