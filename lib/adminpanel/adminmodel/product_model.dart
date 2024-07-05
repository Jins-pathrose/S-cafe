import 'package:hive/hive.dart';
part 'product_model.g.dart';

@HiveType(typeId: 2)
class Addproduct extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? price;

  @HiveField(2)
  String? category;

  @HiveField(3)
  String? discount;

  @HiveField(4)
  String? image;

  @HiveField(5)
  int? id;

  @HiveField(6)
  String? selectedSize; // Add this field

  Addproduct(
      {required this.name,
      required this.price,
      required this.category,
      required this.discount,
      required this.image,
      required this.id,
      this.selectedSize});
}
