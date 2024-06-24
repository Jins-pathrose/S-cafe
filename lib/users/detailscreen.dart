import 'dart:io';

import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 189, 108, 102),
        title: Text("Details"),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      // totalprice.toString(),
                                      '₹${widget.products.price}',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 15, 137, 19)
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text('Select your size',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                              SizedBox(height: 20,),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(height: 50,width: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color.fromARGB(255, 142, 77, 72)
                                      ),
                                      child: Center(child: Text('7',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),))),
                                      Container(height: 50,width: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color.fromARGB(255, 142, 77, 72)
                                      ),
                                      child: Center(child: Text('7.5',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),))),
                                      Container(height: 50,width: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color.fromARGB(255, 142, 77, 72)
                                      ),
                                      child: Center(child: Text('8',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),))),
                                      Container(height: 50,width: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color.fromARGB(255, 142, 77, 72)
                                      ),
                                      child: Center(child: Text('8.5',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),))),
                                      Container(height: 50,width: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color.fromARGB(255, 142, 77, 72)
                                      ),
                                      child: Center(child: Text('9',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),))),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 50),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Delivery with in",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 5,
                                          ),
                                          child: Icon(
                                            CupertinoIcons.clock,
                                            color: Colors.red,
                                          ),
                                        ),
                                        Text(
                                          "3 Days",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      height: 50,
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 189, 108, 102)),
                        child: Text(
                          'Buy Now',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
