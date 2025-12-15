import 'package:flutter/material.dart';
import 'package:icecream/views/widgets/extras_widget.dart';
import 'package:icecream/views/widgets/flavours_widget.dart';
import 'package:provider/provider.dart';

import '../../models/container_type.dart';
import '../../presenters/home_page_presenter.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = context.watch<HomePagePresenter>();

    final enabled = presenter.totalScoops > 0;

    final double fontSizeTitle = 35;
    final double fontSizeMedium = 20;
    final double fontSizeText = 15;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Ice cream", style: TextStyle(fontSize: fontSizeTitle)),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Flavours",
                    style: TextStyle(fontSize: fontSizeMedium),
                    textAlign: TextAlign.start,
                  ),
                  presenter.canAddScoop
                      ? Text(
                          "maximum 5",
                          style: TextStyle(
                            fontSize: fontSizeText,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.end,
                        )
                      : Text(
                          "Too many scooped",
                          style: TextStyle(
                            fontSize: fontSizeText,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.end,
                        ),
                ],
              ),

              Column(
                children: presenter.flavours
                    .map(
                      (flavour) => FlavoursWidget(
                        flavourId: flavour.id,
                        imagePath: flavour.imagePath.replaceFirst(
                          'assets/',
                          '',
                        ),
                        flavourName: flavour.name,
                      ),
                    )
                    .toList(),
              ),

              Text(
                "Containers",
                style: TextStyle(fontSize: fontSizeMedium),
                textAlign: TextAlign.start,
              ),

              RadioGroup<ContainerType>(
                groupValue: presenter.selectedContainer,
                onChanged: enabled ? presenter.onContainerChanged : (_) {},

                child: Column(
                  children: presenter.containers
                      .map(
                        (container) => Row(
                          children: [
                            Radio<ContainerType>(
                              value: container.type,

                              enabled: enabled,
                              fillColor:
                                  WidgetStateProperty.resolveWith<Color?>((
                                    states,
                                  ) {
                                    if (states.contains(WidgetState.disabled)) {
                                      return Colors.grey;
                                    }
                                    return Colors.blue;
                                  }),
                            ),

                            Text(
                              container.type == ContainerType.cone
                                  ? "Cone"
                                  : "Cup",
                              style: TextStyle(
                                fontSize: fontSizeText,
                                color: enabled ? Colors.black : Colors.grey,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              container.price > 0
                                  ? "${container.price.toStringAsFixed(2)}€"
                                  : "Free",
                              style: TextStyle(
                                fontSize: fontSizeText,
                                color: enabled ? Colors.black : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),

              Text(
                "Extras",
                style: TextStyle(fontSize: fontSizeMedium),
                textAlign: TextAlign.start,
              ),
              Column(
                children: presenter.extras
                    .map(
                      (extra) => ExtrasWidget(
                        extraId: extra.id,
                        extrasName: extra.name,
                        price: extra.price,
                      ),
                    )
                    .toList(),
              ),

              const Spacer(),

              Row(
                children: [
                  Text(
                    "Price",
                    style: TextStyle(fontSize: fontSizeMedium),
                    textAlign: TextAlign.start,
                  ),
                  Expanded(child: const SizedBox()),
                  Text(
                    "${presenter.totalPrice.toString()} €",
                    style: TextStyle(fontSize: fontSizeMedium, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),

              const SizedBox(height: 32),

              Row(
                children: [
                  Spacer(),
                  ElevatedButton(
                    onPressed: presenter.canMakeIcecream
                        ? () => presenter.makeIcecream()
                        : null,
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
