import 'dart:io';

import 'package:firstproject/address/addressScreen.dart';
import 'package:firstproject/adminpanel/adminmodel/product_model.dart';
import 'package:firstproject/funtions/addCart.dart';
import 'package:firstproject/funtions/cart_dbhelper.dart';
import 'package:firstproject/funtions/dbfunction.dart';
import 'package:firstproject/models/cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

Carthelper chelp = Carthelper();
dbhelper dbh = dbhelper();
late double totals;

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

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
        body: cartBox.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/empty-cart-2130356-1800917.webp',
                    height: 350,
                  ),
                  Text(
                    "Your Cart is Currently Empty❗",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 400,
                      child: ValueListenableBuilder(
                          valueListenable: addcartlist,
                          builder:
                              (context, List<Cart> addcartlist, Widget? child) {
                            return ListView.builder(
                                itemCount: addcartlist.isEmpty
                                    ? 1
                                    : addcartlist.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final cart =
                                      addcartlist.reversed.toList()[index];
                                  int price = int.parse(cart.price!);
                                  int? quantity = cart.count;
                                  int totalPrice = price * quantity!;

                                  total += totalPrice;
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        right: 10,
                                        left: 10),
                                    child: Slidable(
                                      startActionPane: ActionPane(
                                          motion: StretchMotion(),
                                          children: [
                                            SlidableAction(
                                              label: 'Remove',
                                              onPressed: (context) {
                                                setState(() {
                                                  removecart(context, cart.id);
                                                });
                                              },
                                              icon: Icons.delete,
                                              autoClose: true,
                                              backgroundColor: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            )
                                          ]),
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    child: Container(
                                                      width: 80,
                                                      height: 100,
                                                      child: Image.file(
                                                        File(cart.image!),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.all(8),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text(
                                                          cart.name!,
                                                          style:
                                                              GoogleFonts.rubik(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                        ),
                                                        SizedBox(
                                                          height: 15,
                                                        ),
                                                        Text('₹${cart.price!}'),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 140,
                                                    decoration: BoxDecoration(
                                                        color: Color.fromARGB(
                                                            255, 215, 234, 248),
                                                        border: Border.all(
                                                            color:
                                                                Colors.black),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: Column(
                                                      children: [
                                                        IconButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              cart.count =
                                                                  (cart.count! +
                                                                          1)
                                                                      .clamp(
                                                                          0, 9);
                                                            });
                                                          },
                                                          icon: Icon(
                                                            CupertinoIcons.add,
                                                          ),
                                                          iconSize: 20,
                                                        ),
                                                        Text('${cart.count}'),
                                                        IconButton(
                                                          onPressed: () {
                                                            cart.count =
                                                                (cart.count! -
                                                                        1)
                                                                    .clamp(
                                                                        0, 9);
                                                          },
                                                          icon: Icon(
                                                              CupertinoIcons
                                                                  .minus),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        width: double.infinity,
                                        height: 120,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                    ),
                                  );
                                });
                          }),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      child: ValueListenableBuilder<Box<Cart>>(
                        valueListenable: cartBox.listenable(),
                        builder: (BuildContext context, cartBox, _) {
                          return Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Text(
                                      //   "Sub-Total",
                                      //   style: TextStyle(
                                      //     fontSize: 20,
                                      //   ),
                                      // ),
                                      // Text(
                                      //   '₹${total.toString()}',
                                      //   style: TextStyle(fontSize: 20),
                                      // ),
                                    ],
                                  ),
                                ),
                               
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Delivery",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "Free Delivery",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "₹${total}", // Assuming total is the correct variable
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.red),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      child: Container(
                        height: 50,
                        width: 400,
                        child: ElevatedButton(
                           style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color.fromARGB(255, 255, 230, 0)),
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
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),
                            )
                            ),
                      ),
                    )
                  ],
                ),
              ));
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
}
