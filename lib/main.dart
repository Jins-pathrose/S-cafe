import 'package:firstproject/adminpanel/adminmodel/product_model.dart';
import 'package:firstproject/models/user_login.dart';
import 'package:firstproject/widgets/splash.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

const SAVE_KEY = 'userLogin';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.openBox<Addproduct>('dbname');

  if (!Hive.isAdapterRegistered(AddproductAdapter().typeId)) {
    Hive.registerAdapter(AddproductAdapter());
  }
  if (!Hive.isAdapterRegistered(UserAdapter().typeId)) {
    Hive.registerAdapter(UserAdapter());
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
