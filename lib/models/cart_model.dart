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

  @HiveField(7)
  String? selectedSize;

  Cart({
    required this.name,
    required this.price,
    required this.image,
    required this.count,
    required this.category,
    required this.discount,
    required this.id,
     this.selectedSize,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Cart &&
      other.name == name &&
      other.price == price &&
      other.image == image &&
      other.count == count &&
      other.id == id &&
      other.category == category &&
      other.discount == discount &&
      other.selectedSize == selectedSize;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      price.hashCode ^
      image.hashCode ^
      count.hashCode ^
      id.hashCode ^
      category.hashCode ^
      discount.hashCode ^
      selectedSize.hashCode;
  }
}
