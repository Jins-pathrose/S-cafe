// import 'package:hive/hive.dart';
// part 'user_login.g.dart';

// @HiveType(typeId: 1)
// class User extends HiveObject{
//   @HiveField(0)
//   String name;

//   @HiveField(1)
//   String phone;

//   @HiveField(2)
//   String email;

//   @HiveField(3)
//   String password;

//   @HiveField(4)
//   String image;

//   @HiveField(5)
//   int? id;
//   User({required this.name,
//         required this.phone,
//         required this.email,
//         required this.password,
//         required this.image,
//         required this.id});

//   get number => null;


// } 
import 'package:hive/hive.dart';
part 'user_login.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String phone;

  @HiveField(2)
  String email;

  @HiveField(3)
  String password;

  @HiveField(4)
  String image;

  @HiveField(5)
  int? id;

  User({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.image,
    required this.id,
  });

  get number => null;
}
