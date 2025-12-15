class Flavour {
  final String id;
  final String name;
  final String imagePath;
  int stockMl;

  Flavour({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.stockMl,
  });

  int get availableScoops => stockMl ~/ 50;
  bool get isEmpty => stockMl < 50;
}
