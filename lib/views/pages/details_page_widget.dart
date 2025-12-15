import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:icecream/models/flavour.dart';
import 'package:provider/provider.dart';

import '../../models/repository/stock_repository.dart';
import '../../presenters/details_page_presenter.dart';

class DetailsPageWidget extends StatelessWidget {
  const DetailsPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final flavour = ModalRoute.of(context)!.settings.arguments as Flavour;

    return ChangeNotifierProvider(
      create: (context) => DetailsPresenter(GetIt.instance<StockRepository>())..init(flavour),
      child: const _DetailsPageContent(),
    );
  }
}

class _DetailsPageContent extends StatelessWidget {
  const _DetailsPageContent();

  @override
  Widget build(BuildContext context) {
    final presenter = context.watch<DetailsPresenter>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(presenter.flavour!.name, style: const TextStyle(fontSize: 35)),
              Row(
                children: [
                  Image(image: AssetImage(presenter.flavour!.imagePath), height: 100),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      "${presenter.flavour!.name} flavour is empty",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: "Signature",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: presenter.updateSignature,
                      controller: TextEditingController(text: presenter.signature),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black87,
                    ),
                    onPressed: presenter.sendOrder,
                    child: const Text("Order"),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: presenter.toggleShowAllItems,
                  child: Text(presenter.showAllItems ? "Collapse other items" : "Check all items"),
                ),
              ),

              if (presenter.showAllItems) ...[
                const SizedBox(height: 16),
                Expanded(
                  child: ListView(
                    children: [
                      ...presenter.flavours.map((f) => _StockItem(
                        label: f.name,
                        stock: "${f.stockMl} ml",
                        isSelected: presenter.isFlavourSelected(f.name),
                        isDisabled: presenter.isFlavourDisabled(f.name),
                        onChanged: () => presenter.toggleFlavourSelection(f.name),
                      )),
                      ...presenter.containers.map((c) => _StockItem(
                        label: c.type.name,
                        stock: "${c.stock}",
                        isSelected: presenter.isContainerSelected(c.type.name),
                        onChanged: () => presenter.toggleContainerSelection(c.type.name),
                      )),
                      ...presenter.extras.map((e) => _StockItem(
                        label: e.name,
                        stock: e.unit == "ml" ? "${e.stock} ml" : "${e.stock} g",
                        isSelected: presenter.isExtraSelected(e.name),
                        onChanged: () => presenter.toggleExtraSelection(e.name),
                      )),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: presenter.sendBulkOrder,
                    child: const Text("Order"),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _StockItem extends StatelessWidget {
  final String label;
  final String stock;
  final bool isSelected;
  final bool isDisabled;
  final VoidCallback onChanged;

  const _StockItem({
    required this.label,
    required this.stock,
    required this.isSelected,
    this.isDisabled = false,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Checkbox(
            value: isSelected,
            onChanged: isDisabled ? null : (_) => onChanged(),
            activeColor: const Color(0xFF6B5B95),
          ),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: isDisabled ? Colors.grey : Colors.black,
              ),
            ),
          ),
          Text(stock),
        ],
      ),
    );
  }
}