
import 'dart:io';

import 'package:firstproject/address/address_screen.dart';
import 'package:firstproject/adminpanel/adminmodel/product_model.dart';
import 'package:firstproject/funtions/addCart.dart';
import 'package:firstproject/funtions/dbfunction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firstproject/models/cart_model.dart';
import 'package:firstproject/funtions/cart_dbhelper.dart';

carthHelper chelp = carthHelper();
dbhelper dbh = dbhelper();

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Box<Cart> cartBox = Hive.box<Cart>('cart');
  late Box<Addproduct> pdBox = Hive.box<Addproduct>('dbname');
  final int total = 0;

  @override
  void initState() {
    super.initState();
    chelp.getall();
    dbh.getall();
  }

  @override
  void didUpdateWidget(covariant CartScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  Widget build(BuildContext context) {
    Future.delayed(Duration(microseconds: 1), () {
      setState(() {});
    });
    var total = 0;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color.fromRGBO(189, 108, 102, 1),
        title: Text(
          "Cart",
          style: GoogleFonts.rubik(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: addcartlist,
        builder: (context, List<Cart> addcartlist, Widget? child) {
          if (addcartlist.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/empty-cart-2130356-1800917.webp',
                    height: 350,
                  ),
                  Text(
                    "Your Cart is Currently Empty❗",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          } else {
            var total = 0;
            for (var cart in addcartlist) {
              int price = int.parse(cart.price!);
              int? quantity = cart.count;
              total += price * quantity!;
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: addcartlist.isEmpty ? 1 : addcartlist.length,
                    itemBuilder: (context, index) {
                      final cart = addcartlist.reversed.toList()[index];
                      int price = int.parse(cart.price!);
                      int? quantity = cart.count;
                      int totalPrice = price * quantity!;

                      total += totalPrice;
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Slidable(
                          startActionPane: ActionPane(
                            motion: StretchMotion(),
                            children: [
                              SlidableAction(
                                label: 'Remove',
                                onPressed: (context) {
                                  removecart(context, cart.id);
                                },
                                icon: Icons.delete,
                                autoClose: true,
                                backgroundColor: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ],
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.file(
                                        File(cart.image!),
                                        width: 80,
                                        height: 100,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cart.name!,
                                          style: GoogleFonts.rubik(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          '₹${cart.price}',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                Color.fromARGB(255, 0, 143, 5),
                                          ),
                                        ),
                                        Text(
                                          'Size: ${cart.selectedSize ?? 'N/A'}',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                Color.fromARGB(255, 255, 8, 8),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 140,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 215, 234, 248),
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                cart.count = (cart.count! + 1)
                                                    .clamp(0, 9);
                                                chelp.save(cart);
                                              });
                                              if (cart.count == 0) {
                                                removecartDirectly(cart.id);
                                              }
                                            },
                                            icon: Icon(CupertinoIcons.add),
                                          ),
                                          Text('${cart.count}'),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                cart.count = (cart.count! - 1)
                                                    .clamp(0, 9);
                                                if (cart.count == 0) {
                                                  removecartDirectly(cart.id);
                                                } else {
                                                  chelp.save(cart);
                                                }
                                              });
                                            },
                                            icon: Icon(CupertinoIcons.minus),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Delivery",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "Free Delivery",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Divider(color: Colors.black),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "₹${total.toStringAsFixed(2)}",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 216, 19),
                        minimumSize: Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        if (cartBox.isNotEmpty) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => ViewAddress(
                                        total: total,
                                      )));
                        } else {
                          Navigator.pop(context);
                          showDailogealert(context);
                        }
                      },
                      child: Text('Checkout'),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  void showDailogealert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Cart was Empty',
          ),
          content: Text('You need to add a Product '),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'))
          ],
        );
      },
    );
  }

  void removecartDirectly(int? id) {
    setState(() {
      cartBox.delete(id);
      chelp.getall();
    });
  }
}

