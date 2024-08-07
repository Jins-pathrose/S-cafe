import 'dart:io';

import 'package:firstproject/adminpanel/adminorder/admin_orderdetails.dart';
import 'package:firstproject/funtions/order_function.dart';
import 'package:firstproject/models/order.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrdersScreenpage extends StatefulWidget {
  const OrdersScreenpage({super.key});
  @override
  State<OrdersScreenpage> createState() => _OrdersScreenpageState();
}
class _OrdersScreenpageState extends State<OrdersScreenpage> {
  @override
  void initState() {
    super.initState();
    getorder();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 17,
          ),
          ValueListenableBuilder(
              valueListenable: orderlist,
              builder: (context, List<Oredrplace> order, Widget? child) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: order.length,
                    itemBuilder: (BuildContext context, int index) {
                      final orderdetail = order.reversed.toList()[index];
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                            )),
                        margin: EdgeInsets.all(10.0),
                        height: 160,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.start, //lastupdate
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    height: 75,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Image.file(
                                        File(orderdetail.productImage))),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      orderdetail.productName,
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Qty : ${orderdetail.productCount.toString()}',
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 44,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  //   mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'OrderPlaced',
                                      style: GoogleFonts.rubik(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      '₹${orderdetail.totalPrice.toString()}',
                                      style: GoogleFonts.rubik(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (ctx) => adminDetials(
                                                       id: orderdetail.id,
                                                       orderpd: orderdetail,
                                                      // name:
                                                      //     orderdetail.productName,
                                                      // price: orderdetail
                                                      //     .productPrice,
                                                      // details: orderdetail
                                                      //     .productabout,
                                                      // total:
                                                      //     orderdetail.totalPrice,
                                                      // addressname: orderdetail
                                                      //     .deliveryName,
                                                      // address: orderdetail
                                                      //     .deliveryAddress,
                                                      // contact: orderdetail
                                                      //     .deliveryPhone,
                                                      // count: orderdetail
                                                      //     .productCount,
                                                      // city: orderdetail
                                                      //     .deliveryCity,
                                                      // pincode:
                                                      //     orderdetail.pincode,
                                                      // image: orderdetail
                                                      //     .productImage,
                                                      //      status: orderdetail.status
                                                    )));
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Color.fromARGB(255, 114, 217, 208))),
                                      child: Text('Details',style: TextStyle(color: Colors.black),)),                    
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}