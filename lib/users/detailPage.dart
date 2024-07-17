import 'dart:io';
import 'package:clippy_flutter/arc.dart';
import 'package:firstproject/funtions/addCart.dart';
import 'package:firstproject/funtions/dbfunction.dart';
import 'package:firstproject/models/cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({
    required this.products,
    super.key,
  });
  dynamic products;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<String> sizes = ['7', '7.5', '8', '8.5', '9'];
  var help = dbhelper();
  late Box<Cart> cartBox;

  @override
  void initState() {
    super.initState();
    openBox();
  }

  Future<void> openBox() async {
    cartBox = await Hive.openBox<Cart>('cart');
    setState(() {}); // Trigger rebuild to ensure the box is ready
  }

  @override
  Widget build(BuildContext context) {
    if (!Hive.isBoxOpen('cart')) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 189, 108, 102),
          title: Text("Details"),
          centerTitle: true,
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 189, 108, 102),
        title: Text("Details Page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 5, bottom: 10),
        child: ListView(
          children: [
            SizedBox(
              height: 280,
              child: Padding(
                padding: EdgeInsets.all(7),
                child: Image.file(File(widget.products.image!)),
              ),
            ),
            Arc(
              edge: Edge.TOP,
              arcType: ArcType.CONVEY,
              height: 50,
              child: Container(
                height: 400,
                width: double.infinity,
                color: Color.fromARGB(255, 213, 211, 211),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 60, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.products.name}',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '₹ ${widget.products.price}',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 15, 137, 19),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '% ${widget.products.discount} off',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 248, 0, 0),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Available Size  \n',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 24),
                                      ),
                                      TextSpan(
                                        text:
                                            ' 👟 7\n 👟 7.5\n 👟 8\n 👟 8.5\n 👟 9',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 71, 41, 29),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Delivery within",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.clock,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          " 5 Days",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'assets/Scafe_Logo-removebg-preview.png',
                            width: 50,
                            height: 50,
                          ),
                          Text(
                            "SCAFE providing DISCOUNT for every product",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: 16,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                "🚚 FREE DELIVERY AVAILABLE NOW",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromARGB(255, 155, 9, 41)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
