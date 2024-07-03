
import 'dart:io';

import 'package:clippy_flutter/arc.dart';
import 'package:firstproject/funtions/addCart.dart';
import 'package:firstproject/funtions/dbfunction.dart';
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
  String? _selectedSize;
    var help = dbhelper();


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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '₹${widget.products.price}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 15, 137, 19),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'Select your size',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 50,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: sizes.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                  child: ChoiceChip(
                                    label: Text(sizes[index]),
                                    selected: _selectedSize == sizes[index],
                                    onSelected: (bool selected) {
                                      setState(() {
                                        _selectedSize = selected ? sizes[index] : null;
                                      });
                                    },
                                    backgroundColor: Colors.grey[200],
                                    selectedColor: Colors.blue,
                                    labelStyle: TextStyle(
                                      color: _selectedSize == sizes[index] ? Colors.white : Colors.black,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Delivery within",
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
                                      padding: EdgeInsets.symmetric(horizontal: 5),
                                      child: Icon(
                                        CupertinoIcons.clock,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Text(
                                      "3 Days",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
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
                          checkCart(widget.products, context);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 230, 0),
                      ),
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

