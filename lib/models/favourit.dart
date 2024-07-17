import 'package:hive/hive.dart';
part 'favourit.g.dart';

@HiveType(typeId: 6)
class Addfavorite extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? price;

  @HiveField(2)
  String? image;

  @HiveField(3)
  String? discount;

  @HiveField(4)
  String? category;

  @HiveField(5)
  int? id;

  @HiveField(6)
  String? selectedSize;

  Addfavorite({
    required this.name,
    required this.price,
    required this.image,
    required this.discount,
    required this.category,
    required this.id,
    this.selectedSize
  });
}
