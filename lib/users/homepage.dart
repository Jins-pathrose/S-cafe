import 'package:firstproject/adminpanel/adminHome.dart';
import 'package:firstproject/adminpanel/adminmodel/product_model.dart';
import 'package:firstproject/custom/home_extract.dart';
import 'package:firstproject/funtions/dbfunction.dart';
import 'package:firstproject/users/kids.dart';
import 'package:firstproject/users/mens.dart';
import 'package:firstproject/users/womens.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

dbhelper help = dbhelper();


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    late Box<Addproduct> productBox = Hive.box<Addproduct>('dbname');
  // final Box<Cart> cartBox = Hive.box<Cart>('cart');
    @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    await Hive.openBox<Addproduct>('dbname');
    productBox = Hive.box<Addproduct>('dbname');
    help.getall();
  }

  var dbp = dbhelper();
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(microseconds: 1), () {
      setState(() {});
    });
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 189, 108, 102),
       body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      // Navigator.push(context, (MaterialPageRoute(builder: (context)=>HomePage())));
                    },
                    child: Text(
                      'All',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, (MaterialPageRoute(builder: (context)=>MensPage())));
                    },
                    child: Text(
                      'Mens',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, (MaterialPageRoute(builder: (context)=>WomensPage())));
                    },
                    child: Text(
                      'Womens',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, (MaterialPageRoute(builder: (context)=>KidsPage())));
                    },
                    child: Text(
                      'Kids',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            homevaluelistnable()
          ],
        ),
      ),
    );
  }
}