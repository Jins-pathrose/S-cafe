import 'package:hive/hive.dart';
part 'address.g.dart';

@HiveType(typeId: 4)
class Address extends HiveObject{

  @HiveField(0)
  String usrname;

  @HiveField(1)
  String address;

  @HiveField(2)
  String city;

  @HiveField(3)
  String number;

  @HiveField(4)
  int id;

  @HiveField(5)
  String pincode;

    Address({
 
    required this.address,
    required this.city,
    required this.pincode,
    required this.usrname,
    required this.number,
    required this.id,
  });
}