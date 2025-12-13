class Extra {

  final String id;
  final String name;
  final double price;
  final String unit;
  final int consumptionPerUse;
  int stock;

  Extra({required this.id, required this.name, required this.price,
    required this.unit, required this.consumptionPerUse, required this.stock});

  bool get isEmpty => stock < consumptionPerUse;
}
