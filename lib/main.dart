import 'package:firstproject/adminpanel/adminmodel/product_model.dart';
import 'package:firstproject/models/address.dart';
import 'package:firstproject/models/cart_model.dart';
import 'package:firstproject/models/favourit.dart';
import 'package:firstproject/models/user_login.dart';
import 'package:firstproject/widgets/splash.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

const SAVE_KEY = 'userLogin';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.openBox<Cart>('cart');
  Hive.openBox<Address>('address');
  Hive.openBox<Addproduct>('dbname');
  Hive.openBox<Addfavorite>('add_fav');


  if (!Hive.isAdapterRegistered(AddproductAdapter().typeId)) {
    Hive.registerAdapter(AddproductAdapter());
  }
  if (!Hive.isAdapterRegistered(UserAdapter().typeId)) {
    Hive.registerAdapter(UserAdapter());
  }
  if (!Hive.isAdapterRegistered(CartAdapter().typeId)) {
    Hive.registerAdapter(CartAdapter());
  }
    if (!Hive.isAdapterRegistered(AddressAdapter().typeId)) {
    Hive.registerAdapter(AddressAdapter());
  }
   if (!Hive.isAdapterRegistered(AddfavoriteAdapter().typeId)) {
    Hive.registerAdapter(AddfavoriteAdapter());
  }

  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
