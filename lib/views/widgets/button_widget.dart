import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../presenters/home_page_presenter.dart';

class ButtonWidget extends StatelessWidget {
  final String flavourId;

  const ButtonWidget({super.key, required this.flavourId});

  @override
  Widget build(BuildContext context) {
    final presenter = context.watch<HomePagePresenter>();
    final scoopCount = presenter.getScoopCount(flavourId);
    final canAdd = presenter.canAddScoop;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(999),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(999),
            onTap: scoopCount > 0
                ? () => presenter.removeScoop(flavourId)
                : null,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Icon(
                Icons.remove,
                size: 20,
                color: scoopCount > 0 ? Colors.black87 : Colors.black26,
              ),
            ),
          ),

          Container(width: 1, height: 24, color: Colors.black12),

          InkWell(
            borderRadius: BorderRadius.circular(999),
            onTap: canAdd ? () => presenter.addScoop(flavourId) : null,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Icon(
                Icons.add,
                size: 20,
                color: canAdd ? Colors.black87 : Colors.black26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
