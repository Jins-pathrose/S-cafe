import 'package:firstproject/adminpanel/adminmodel/product_model.dart';
import 'package:firstproject/models/user_login.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<Addproduct>> productlist = ValueNotifier([]);
String dbname = 'dbname';

ValueNotifier<List<User>> userslist = ValueNotifier([]);

class dbhelper {
    Future<void> delete(int id) async {
    final remove = await Hive.openBox<Addproduct>(dbname);
    remove.delete(id);
    getall();
  }

  Future<void> save(Addproduct value) async {
    final save = await Hive.openBox<Addproduct>(dbname);
    final id = await save.add(value);
    final data = save.get(id);
    await save.put(
      id,
      Addproduct(
        name: data!.name,
        // category: data.category,
        price: data.price,
        discount: data.discount,
        image: data.image,
        category: data.category,
        id: id,
      ),
    );
  
    
  }

  Future<void> getall() async {
    final save = await Hive.openBox<Addproduct>(dbname);
    productlist.value.clear();
    productlist.value.addAll(save.values);
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    productlist.notifyListeners();
  }
}