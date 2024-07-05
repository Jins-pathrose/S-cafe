import 'package:firstproject/adminpanel/adminmodel/product_model.dart';
import 'package:firstproject/funtions/cart_dbhelper.dart';
import 'package:firstproject/models/cart_model.dart';
import 'package:firstproject/models/user_login.dart';
import 'package:firstproject/users/cartScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';

Carthelper chelp = Carthelper();


void checkCart(Addproduct addproduct, BuildContext context) async {
  final cartBox = await Hive.openBox<Cart>('cart');
  final cartExists = cartBox.values.any((cartItem) => cartItem.name == addproduct.name);
  
  if (cartExists) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Product Already Exist!'),
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
      id: addproduct.id,
      selectedSize: addproduct.selectedSize,
    );
    await cartBox.add(cart);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration: Duration(seconds: 1),
      content: Text('Added to Cart Successfully'),
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
        content: Text('Do you want to remove this item from the cart?'),
        actions: [
          ElevatedButton(
            onPressed: () async {
              await chelp.delete(id!); // Use the delete method from Carthelper
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Item removed from cart'),
              ));
            },
            child: Text('Yes'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('No'),
          ),
        ],
      );
    },
  );
}
// Future<void> delete(context, int? id) async {
//   final remove = await Hive.openBox<Cart>('cart');
//   remove.delete(id);
//   chelp.getall();
//   Navigator.of(context).pop(
//     MaterialPageRoute(builder: (context) => CartScreen()),
//   );
// }


