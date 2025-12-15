import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../presenters/home_page_presenter.dart';

class ExtrasWidget extends StatelessWidget {
  final String extraId;
  final String extrasName;
  final double price;

  const ExtrasWidget({
    super.key,
    required this.extraId,
    required this.extrasName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final double fontSize = 15;

    final presenter = context.watch<HomePagePresenter>();
    final isEnabled = presenter.totalScoops > 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Checkbox(
          value: presenter.isExtraSelected(extraId),
          onChanged: isEnabled ? (_) => presenter.toggleExtra(extraId) : null,
        ),
        Text(
          extrasName,
          style: TextStyle(
            fontSize: fontSize,
            color: isEnabled ? Colors.black : Colors.grey,
          ),
        ),
        Spacer(),
        Text(
          "${price.toStringAsFixed(2)}€",
          style: TextStyle(
            fontSize: fontSize,
            color: isEnabled ? Colors.black : Colors.grey,
          ),
        ),
      ],
    );
  }
}
