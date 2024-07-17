// import 'package:hive_flutter/adapters.dart';

// part 'cancelorder.g.dart';

// @HiveType(typeId: 11)
// class Cancelorder {
//   @HiveField(0)
//   int? id;

//   @HiveField(1)
//   String name;
//   @HiveField(2)
//   String price;
//  @HiveField(3)
//   String size;
//    @HiveField(4)
//   String image;
//    @HiveField(5)
//   String deliveryAddress;
//    @HiveField(6)
//   String deliveryName;
//    @HiveField(7)
//   String deliveryPhone;
//    @HiveField(8)
//  String deliveryCity;
//    @HiveField(9)
//   String pincode;
//    @HiveField(10)
//   String productCount;


// Cancelorder(
//   {
//     required this.name,
//     required this.price,
//     required this.size,
//     required this.image,
//     required this.deliveryAddress,
//     required this.deliveryName,
//     required this.deliveryPhone,
//     required this.pincode,
//     required this.productCount,
//     required this.id, 
//     required this.deliveryCity,
//   }
// );
// }
import 'package:hive_flutter/hive_flutter.dart';

part 'cancelorder.g.dart';

@HiveType(typeId: 11)
class Cancelorder {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String price;

  @HiveField(3)
  String size;

  @HiveField(4)
  String image;

  @HiveField(5)
  String deliveryAddress;

  @HiveField(6)
  String deliveryName;

  @HiveField(7)
  String deliveryPhone;

  @HiveField(8)
  String deliveryCity;

  @HiveField(9)
  String pincode;

  @HiveField(10)
  String productCount;

  Cancelorder({
    required this.name,
    required this.price,
    required this.size,
    required this.image,
    required this.deliveryAddress,
    required this.deliveryName,
    required this.deliveryPhone,
    required this.pincode,
    required this.productCount,
    required this.id,
    required this.deliveryCity,
  });
}
