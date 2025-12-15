import 'package:icecream/models/container_type.dart';
import 'package:icecream/models/icecream_container.dart';
import '../extra.dart';
import '../flavour.dart';
import 'stock_repository.dart';

class StockRepositoryImpl implements StockRepository {
  @override
  List<Flavour> flavours = [
    Flavour(
      id: 'chocolate',
      name: 'Chocolate',
      imagePath: 'assets/chocolate.jpg',
      stockMl: 300,
    ),
    Flavour(
      id: 'vanilla',
      name: 'Vanilla',
      imagePath: 'assets/vanilla.jpg',
      stockMl: 100,
    ),
    Flavour(
      id: 'pistachio',
      name: 'Pistachio',
      imagePath: 'assets/pistachio.jpg',
      stockMl: 0,
    ),
  ];

  @override
  List<Extra> extras = [
    Extra(
      id: 'whipped_cream',
      name: 'Whipped cream',
      price: 0.95,
      unit: 'ml',
      consumptionPerUse: 75,
      stock: 150,
    ),
    Extra(
      id: 'hazelnuts',
      name: 'Hazelnuts',
      price: 0.95,
      unit: 'g',
      consumptionPerUse: 5,
      stock: 100,
    ),
  ];

  @override
  List<IcecreamContainer> containers = [
    IcecreamContainer(type: ContainerType.cone, price: 1.00, stock: 2),
    IcecreamContainer(type: ContainerType.cup, price: 0.00, stock: 7),
  ];

  @override
  void consumeScoop(String flavourId, int count) {
    final flavour = flavours.firstWhere((f) => f.id == flavourId);
    flavour.stockMl -= count * 50;
  }

  @override
  void consumeExtra(String extraId) {
    final extra = extras.firstWhere((e) => e.id == extraId);
    extra.stock -= extra.consumptionPerUse;
  }

  @override
  void consumeContainer(ContainerType type) {
    final container = containers.firstWhere((c) => c.type == type);
    container.stock--;
  }
}
