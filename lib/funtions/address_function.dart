import 'package:firstproject/models/address.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<Address>> addresslist = ValueNotifier([]);
Future<void> addtoaddress(Address value) async {
  final addressDB = await Hive.openBox<Address>('address');
  final id = await addressDB.add(value);
  final data = addressDB.get(id);

  await addressDB.put(
      id,
      Address(
          usrname: data!.usrname,
          number: data.number,
          address: data.address,
          city: data.city,
          pincode: data.pincode,
          id: id,));
  getaddress();
}

Future<void> getaddress() async {
  final addrsssDB = await Hive.openBox<Address>('address');
  addresslist.value.clear();
  addresslist.value.addAll(addrsssDB.values);
  addresslist.notifyListeners();
}