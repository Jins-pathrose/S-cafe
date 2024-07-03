import 'package:firstproject/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
ValueNotifier<List<Cart>> addcartlist = ValueNotifier([]);

class Carthelper {
  Future<void> delete(
    int id,
  ) async {
    final remove = await Hive.openBox<Cart>('cart');
    remove.delete(id);
    getall();
  }

  Future<void> save(Cart value) async {
    final save = await Hive.openBox<Cart>('cart');
    final id = await save.add(value);
    final data = save.get(id);
    await save.put(
        id,
        Cart(
            name: data!.name,
            price: data.price,
            image: data.image,
            count: data.count,
            category: data.category,
            discount: data.discount,
            id: id));
    getall();
  }

  Future<void> getall() async {
    final save = await Hive.openBox<Cart>('cart');
    addcartlist.value.clear();
    addcartlist.value.addAll(save.values);
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    addcartlist.notifyListeners();
  }
}
