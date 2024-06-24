import 'dart:io';

import 'package:firstproject/adminpanel/adminmodel/product_model.dart';
import 'package:firstproject/funtions/dbfunction.dart';
import 'package:firstproject/users/detailscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homecliprect extends StatelessWidget {
  const homecliprect({super.key, required this.addproduct});

  final Addproduct addproduct;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      child: Container(
        color: Colors.grey,
        child: Placeholder(
          child: Image.file(
            File(addproduct.image!),
            height: 161,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

ValueListenableBuilder<List<Addproduct>> homevaluelistnable() {
  return ValueListenableBuilder(
      valueListenable: productlist,
      builder: (BuildContext context, List<Addproduct> addlist, Widget? child) {
        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: addlist.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            mainAxisExtent: 299,
          ),
          itemBuilder: (context, index) {
            final addproduct = addlist.reversed.toList()[index];
            return Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          products: addproduct,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(2),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color.fromARGB(255, 255, 254, 254),
                      ),
                      child: Column(
                        children: [
                          homecliprect(addproduct: addproduct),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  addproduct.name!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .merge(
                                        const TextStyle(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    
                                    Text('${addproduct.discount}% off'),
                                    Text('₹${addproduct.price}',style: TextStyle(color: const Color.fromARGB(255, 25, 147, 29)),),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        CupertinoIcons.heart_fill,
                                      ),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.shopping_cart_outlined),
                                      onPressed: () {},
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ));
          },
        );
      });
}
