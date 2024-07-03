import 'package:firstproject/adminpanel/adminmodel/product_model.dart';
import 'package:firstproject/models/cart_model.dart';
import 'package:firstproject/models/user_login.dart';
import 'package:firstproject/users/cartScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';


void checkCart(Addproduct addproduct, BuildContext context) async {
  final cartBox = await Hive.openBox<Cart>('cart');
  final carExists = cartBox.values.any((user) => user.name == addproduct.name);
  if (carExists) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Product Alredy Exist!'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  } else {
    final cart = Cart(
        name: addproduct.name,
        price: addproduct.price,
        image: addproduct.image,
        count: 1,
        category: addproduct.category,
        discount: addproduct.discount,
        id: -1);
    chelp.save(cart);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration: Duration(seconds: 1),
      content: Text('Add In Cart Succesfully'),
      backgroundColor: Colors.green,
    ));
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
