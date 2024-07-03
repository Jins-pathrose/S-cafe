import 'package:firstproject/models/favourit.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<Addfavorite>> addfavlist = ValueNotifier([]);

Future<void> addtofav(Addfavorite value) async {
  final addfavDB = await Hive.openBox<Addfavorite>('add_fav');
  final id = await addfavDB.add(value);
  final favadata = addfavDB.get(id);
  await addfavDB.put(
      id,
      Addfavorite(
          name: favadata!.name,
          price: favadata.price,
          image: favadata.image,
          discount: favadata.discount,
          category: favadata.category,
          id: id));
  getfavorite();
}

Future<void> getfavorite() async {
  final addfavbox = await Hive.openBox<Addfavorite>('add_fav');
  addfavlist.value.clear();
  addfavlist.value.addAll(addfavbox.values);
  // ignore: invalid_use_of_protected_member
  addfavlist.notifyListeners();
}