import 'package:firstproject/adminpanel/adminmodel/product_model.dart';
import 'package:firstproject/custom/home_extract.dart';
import 'package:firstproject/funtions/dbfunction.dart';
import 'package:firstproject/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

TextEditingController searchcontrol = TextEditingController();
Box<Addproduct> productBox = Hive.box<Addproduct>('dbname');
final Box<Cart> cartBox = Hive.box<Cart>('cart');

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 189, 108, 102),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    searchProducts(value);
                  },
                  controller: searchcontrol,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Find Your Shoes Here...",
                    hintStyle: TextStyle(color: Colors.white),
                    suffixIcon: IconButton(
                        onPressed: () {
                          searchcontrol.clear();
                        },
                        icon: Icon(Icons.close)),
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              homevaluelistnable()
            ],
          ),
        ),

        );
  }
  void searchProducts(String value) {
  final product = productBox.values.toList();
  if (value.isEmpty) {
    productlist.value = product;
  } else {
    final filteredProducts = product
        .where((products) =>
            products.name!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    if (filteredProducts.isEmpty) {
      // Set productlist to an empty list to indicate no items found
      productlist.value = [];
    } else {
      productlist.value = filteredProducts;
    }
    
  }
}
}
