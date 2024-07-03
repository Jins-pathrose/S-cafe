import 'dart:io';

import 'package:firstproject/adminpanel/adminmodel/product_model.dart';
import 'package:firstproject/funtions/addFavourite.dart';
import 'package:firstproject/funtions/dbfunction.dart';
import 'package:firstproject/users/detailscreen.dart';
import 'package:flutter/material.dart';

class categoryScreen extends StatefulWidget {
  final String categorys;
  const categoryScreen({required this.categorys, Key? key}) : super(key: key);

  
  @override
  State<categoryScreen> createState() => _categoryScreenState();
}

class _categoryScreenState extends State<categoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: const Color.fromARGB(255, 189, 108, 102),
          title: Text(widget.categorys),
          centerTitle: true,
        ),
        body: ValueListenableBuilder(
            valueListenable: productlist,
            builder: (context, List<Addproduct> cataddlist, Widget? child) {
              final filterdlist = cataddlist
                  .where((product) => product.category == widget.categorys)
                  .toList();
              if (filterdlist.isEmpty) {
                return Center(
                  child: Text(('No Product')),
                );
              } else {
                return ListView.builder(
                  itemCount: filterdlist.length,
                  itemBuilder: (context, index) {
                    final addproducts = filterdlist[index];
                    return GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 160,
                          child: Card(
                            elevation: 10,
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: ListTile(
                                  leading: Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    child: Image.file(
                                      File(
                                        addproducts.image!,
                                      ),
                                      fit: BoxFit.cover,
                                      width: 90,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${addproducts.name}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 11,
                                      ),
                                      Text(
                                        '₹${addproducts.price}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                  trailing: IconButton(
                                    icon: getIcon(addproducts),
                                    onPressed: () {
                                      setState(() {
                                        addfav_button(addproducts, context);
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(11),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailScreen(
                                                        products: addproducts,
                                                      )));
                                        },
                                        style: ButtonStyle(),
                                        child: Text('Details')),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            }));
    
  }
}