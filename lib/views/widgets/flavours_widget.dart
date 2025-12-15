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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(image: AssetImage("${"assets/"}$imagePath"), height: 50),
              Text(flavourName, style: TextStyle(fontSize: fontSize)),
              ButtonWidget(flavourId: flavourId),

              presenter.getAvailableScoops(flavourId) > 0
                ? Text(
                    presenter.getScoopCount(flavourId).toString(),
                    style: TextStyle(fontSize: fontSize),
                  )
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(12),
                    ),
                    onPressed: () {},
                    child: Icon(Icons.highlight_off),
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
