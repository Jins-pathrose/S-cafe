import 'package:hive/hive.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 3)
class Cart extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? price;

  @HiveField(2)
  String? image;

  @HiveField(3)
  int? count;

  @HiveField(4)
  int? id;

  @HiveField(5)
  String? category;

  @HiveField(6)
  String? discount;

  Cart(
      {required this.name,
      required this.price,
      required this.image,
      required this.count,
      required this.category,
      required this.discount,
      required this.id});
}
