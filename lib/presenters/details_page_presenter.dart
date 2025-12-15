import 'package:flutter/material.dart';
import 'package:icecream/models/flavour.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/extra.dart';
import '../models/icecream_container.dart';
import '../models/repository/stock_repository.dart';

class DetailsPresenter extends ChangeNotifier {
  final StockRepository _stockRepository;

  bool _showAllItems = false;
  String _signature = "Thanks, Luka The GOAT";
  Flavour? _flavour;

  final Set<String> _selectedFlavours = {};
  final Set<String> _selectedContainers = {};
  final Set<String> _selectedExtras = {};

  DetailsPresenter(this._stockRepository);

  bool get showAllItems => _showAllItems;
  String get signature => _signature;
  Flavour? get flavour => _flavour;

  List<Flavour> get flavours => _stockRepository.flavours;
  List<IcecreamContainer> get containers => _stockRepository.containers;
  List<Extra> get extras => _stockRepository.extras;

  Set<String> get selectedFlavours => _selectedFlavours;
  Set<String> get selectedContainers => _selectedContainers;
  Set<String> get selectedExtras => _selectedExtras;

  bool get hasSelection =>
      _selectedFlavours.isNotEmpty ||
      _selectedContainers.isNotEmpty ||
      _selectedExtras.isNotEmpty;

  bool get isFirstOrderButtonEnabled => !_showAllItems;

  void init(Flavour flavour) {
    _flavour = flavour;
    _selectedFlavours.add(flavour.name);
  }

  void toggleShowAllItems() {
    _showAllItems = !_showAllItems;
    notifyListeners();
  }

  void updateSignature(String value) {
    _signature = value;
  }

  void toggleFlavourSelection(String name) {
    if (name == _flavour?.name) return;

    if (_selectedFlavours.contains(name)) {
      _selectedFlavours.remove(name);
    } else {
      _selectedFlavours.add(name);
    }
    notifyListeners();
  }

  void toggleContainerSelection(String name) {
    if (_selectedContainers.contains(name)) {
      _selectedContainers.remove(name);
    } else {
      _selectedContainers.add(name);
    }
    notifyListeners();
  }

  void toggleExtraSelection(String name) {
    if (_selectedExtras.contains(name)) {
      _selectedExtras.remove(name);
    } else {
      _selectedExtras.add(name);
    }
    notifyListeners();
  }

  bool isFlavourSelected(String name) => _selectedFlavours.contains(name);
  bool isContainerSelected(String name) => _selectedContainers.contains(name);
  bool isExtraSelected(String name) => _selectedExtras.contains(name);

  bool isFlavourDisabled(String name) => name == _flavour?.name;

  Future<void> sendOrder() async {
    if (_flavour == null) return;

    final subject = Uri.encodeComponent("Order");
    final body = Uri.encodeComponent(
      "Hi,\nPlease order the following:\n* ${_flavour!.name} icecream\n$_signature",
    );

    final uri = Uri.parse(
      "mailto:order@icecream.com?subject=$subject&body=$body",
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> sendBulkOrder() async {
    final items = <String>[];

    for (final name in _selectedFlavours) {
      items.add("$name icecream");
    }
    for (final name in _selectedContainers) {
      items.add(name);
    }
    for (final name in _selectedExtras) {
      items.add(name);
    }

    final itemsList = items.map((e) => "* $e").join("\n");
    final subject = Uri.encodeComponent("Order");
    final body = Uri.encodeComponent(
      "Hi,\nPlease order the following:\n$itemsList\n$_signature",
    );

    final uri = Uri.parse(
      "mailto:order@icecream.com?subject=$subject&body=$body",
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
