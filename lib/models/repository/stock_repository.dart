import '../container_type.dart';
import '../extra.dart';
import '../flavour.dart';
import '../icecream_container.dart';

abstract class StockRepository {
  List<Flavour> get flavours;
  List<Extra> get extras;
  List<IcecreamContainer> get containers;

  void consumeScoop(String flavourId, int count);
  void consumeExtra(String extraId);
  void consumeContainer(ContainerType type);
}