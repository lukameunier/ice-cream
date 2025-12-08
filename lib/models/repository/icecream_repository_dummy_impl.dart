import 'package:icecream/models/icecream.dart';
import 'package:icecream/models/repository/icecream_repository.dart';

class IcecreamRepositoryDummyImpl implements IcecreamRepository {
  @override
  List<Icecream> icecreams = [
  ];
}