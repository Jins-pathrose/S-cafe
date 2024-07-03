import 'package:firstproject/adminpanel/adminmodel/product_model.dart';
import 'package:firstproject/funtions/addproduct.dart';
import 'package:firstproject/models/favourit.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

void addfav_button(Addproduct addproduct, BuildContext context) async {
  await Hive.openBox<Addfavorite>('add_fav');
  final addfavBox = Hive.box<Addfavorite>('add_fav');

  final favexists =
      addfavBox.values.any((user) => user.name == addproduct.name);
  if (favexists) {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Product Already Exist!'),
      duration: Duration(seconds: 1),
      backgroundColor: Colors.red,
    ));
  } else {
    final fav = Addfavorite(
      name: addproduct.name,
      price: addproduct.price,
      discount: addproduct.discount,
      image: addproduct.image,
      category: addproduct.category,
      id: -1,
    );
    addtofav(fav);

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Added to Favorite'),
      duration: Duration(seconds: 1),
      backgroundColor: Colors.green,
    ));
  }
}

void removefav(BuildContext context, int? id) {
  showDialog(context: context, builder: (context) {
    return AlertDialog(
      title: Text('Remove Favorite'),
      content: Text('Do you want remove'),
      actions: [
        ElevatedButton(onPressed: () {
          deletefav(context, id!);
        }, child: Text('yes')),
        ElevatedButton(onPressed: () {
          Navigator.pop(context);
        }, child: Text('No'))
      ],
    );
  });
}

void deletefav(context, int id) async {
  final remove = await Hive.openBox<Addfavorite>('add_fav');
  remove.delete(id);
  getfavorite();

  Navigator.pop(context);
}

Icon getIcon(addproducts) {
  final addfavBox = Hive.box<Addfavorite>('add_fav');
  final favexists =
      addfavBox.values.any((user) => user.name == addproducts.name);

  if (favexists) {
    return Icon(
      Icons.favorite,
      color: Colors.red,
    );
  } else {
    return Icon(
      Icons.favorite_border,
      color: Colors.black,
    );
  }
}