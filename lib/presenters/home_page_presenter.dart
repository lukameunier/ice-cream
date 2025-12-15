import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:icecream/models/container_type.dart';
import 'package:icecream/models/extra.dart';
import 'package:icecream/models/flavour.dart';
import 'package:icecream/models/icecream_container.dart';
import 'package:icecream/models/repository/stock_repository.dart';
import 'package:icecream/models/services/pricing_service.dart';

class HomePagePresenter extends ChangeNotifier {
  final StockRepository _repository = GetIt.instance<StockRepository>();

  final Map<String, int> _selectedScoops = {};
  ContainerType _selectedContainer = ContainerType.cup;
  final Set<String> _selectedExtras = {};

  List<Flavour> get flavours => _repository.flavours;
  List<Extra> get extras => _repository.extras;
  List<IcecreamContainer> get containers => _repository.containers;

  int get totalScoops =>
      _selectedScoops.values.fold(0, (sum, count) => sum + count);
  bool get canAddScoop => totalScoops < 5;
  bool get canMakeIcecream => totalScoops > 0 && totalScoops <= 5;
  ContainerType get selectedContainer => _selectedContainer;

  int getScoopCount(String flavourId) => _selectedScoops[flavourId] ?? 0;
  bool isExtraSelected(String extraId) => _selectedExtras.contains(extraId);

  double get totalPrice {
    if (totalScoops == 0) return 0;

    double price = PricingService.scoopPrices[totalScoops] ?? 0;

    final container = containers.firstWhere(
      (c) => c.type == _selectedContainer,
    );
    price += container.price;

    for (final extraId in _selectedExtras) {
      final extra = extras.firstWhere((e) => e.id == extraId);
      price += extra.price;
    }

    return price;
  }

  void addScoop(String flavourId) {
    if (!canAddScoopForFlavour(flavourId)) return;

    _selectedScoops[flavourId] = getScoopCount(flavourId) + 1;
    notifyListeners();
  }

  void removeScoop(String flavourId) {
    final count = getScoopCount(flavourId);
    if (count > 0) {
      _selectedScoops[flavourId] = count - 1;
      notifyListeners();
    }
  }

  void selectContainer(ContainerType type) {
    final container = containers.firstWhere((c) => c.type == type);
    if (container.stock > 0) {
      _selectedContainer = type;
      notifyListeners();
    }
  }

  void toggleExtra(String extraId) {
    if (_selectedExtras.contains(extraId)) {
      _selectedExtras.remove(extraId);
    } else {
      final extra = extras.firstWhere((e) => e.id == extraId);
      if (!extra.isEmpty) {
        _selectedExtras.add(extraId);
      }
    }
    notifyListeners();
  }

  void makeIcecream() {
    if (!canMakeIcecream) return;

    _selectedScoops.forEach((flavourId, count) {
      if (count > 0) {
        _repository.consumeScoop(flavourId, count);
      }
    });

    _repository.consumeContainer(_selectedContainer);

    for (final extraId in _selectedExtras) {
      _repository.consumeExtra(extraId);
    }

    _selectedScoops.clear();
    _selectedContainer = ContainerType.cup;
    _selectedExtras.clear();
    notifyListeners();
  }

  void onContainerChanged(ContainerType? value) {
    if (value == null) return;
    selectContainer(value);
  }

  int getAvailableScoops(String flavourId) {
    final flavour = flavours.firstWhere((f) => f.id == flavourId);
    final selected = getScoopCount(flavourId);

    return flavour.availableScoops - selected;
  }

  bool canAddScoopForFlavour(String flavourId) {
    return getAvailableScoops(flavourId) > 0 && canAddScoop;
  }

  Flavour getFlavourById(String flavourId) {
    return flavours.firstWhere((f) => f.id == flavourId);
  }
}
