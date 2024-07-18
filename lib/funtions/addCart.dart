import 'package:firstproject/adminpanel/adminmodel/product_model.dart';
import 'package:firstproject/models/cart_model.dart';
import 'package:firstproject/models/favourit.dart';
import 'package:firstproject/users/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

void checkCart<T>(Box<Cart> cartBox, T product, BuildContext context) {
  if (product is Addproduct) {
    final carExists = cartBox.values.any((user) => user.name == product.name);
    if (carExists) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Product Alredy Exist!'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ));
    } else {
      final cartItem = Cart(
        id: product.id,
        name: product.name,
        price: product.price,
        category: product.category,
        discount: product.discount,
        image: product.image,
        count: 1, // Initial count
        selectedSize:
            product.selectedSize, // Adjust based on your product properties
      );
      chelp.save(cartItem);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('added to cart!'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.green,
        ),
      );
    }
    // cartBox.add(cartItem);
  } else if (product is Addfavorite) {
     final carExists = cartBox.values.any((user) => user.name == product.name);
    if (carExists) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Product Alredy Exist!'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ));
    }else{
    final cartItem = Cart(
      id: product.id,
      name: product.name,
      price: product.price,
      category: product.category,
      discount: product.discount,
      image: product.image,
      count: 1, // Initial count
      selectedSize: product.selectedSize,
    );
    chelp.save(cartItem);
    // cartBox.add(cartItem);
     ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Product Added To Cart'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.green,
        ),
      );
    }
  }
}

void removecart(BuildContext context, int? id) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Remove cart'),
          content: Text('Do you want to remove'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  delete(context, id);
                },
                child: Text('Yes')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('No'))
          ],
        );
      });
}

Future<void> delete(context, int? id) async {
  final remove = await Hive.openBox<Cart>('cart');
  remove.delete(id);
  chelp.getall();
  Navigator.of(context).pop(
    MaterialPageRoute(builder: (context) => CartScreen()),
  );
}


//count