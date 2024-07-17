// import 'package:firstproject/models/cancelorder.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// ValueNotifier<List<Cancelorder>> cancelorderlist = ValueNotifier([]);

// class cancelHelper {
//   Future<void> cancelthisorder(Cancelorder values) async {
//     final cancelDB = await Hive.openBox<Cancelorder>('cancel');
//     final id = await cancelDB.add(values);
//     final data = cancelDB.get(id);
//     await cancelDB.put(
//         id,
//         Cancelorder(
//             name: data!.name,
//             price: data.price,
//             size: data.size,
//             image: data.image,
//             deliveryAddress: data.deliveryAddress,
//             deliveryName: data.deliveryName,
//             deliveryPhone: data.deliveryPhone,
//             pincode: data.pincode,
//             deliveryCity: data.deliveryCity,
//             productCount: data.productCount,
//             id: id));
//     getall();
//   }

//   Future<void> getall() async {
//     final cancelDB = await Hive.openBox<Cancelorder>('cancel');
//     cancelorderlist.value.clear();
//     cancelorderlist.value.addAll(cancelDB.values);
//     // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
//     cancelorderlist.notifyListeners();
//   }
// }
import 'package:firstproject/models/cancelorder.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<Cancelorder>> cancelorderlist = ValueNotifier([]);

class cancelHelper {
  Future<void> cancelthisorder(Cancelorder values) async {
    final cancelDB = await Hive.openBox<Cancelorder>('cancel');
    final id = await cancelDB.add(values);
    final data = cancelDB.get(id);
    await cancelDB.put(
      id,
      Cancelorder(
        name: data!.name,
        price: data.price,
        size: data.size,
        image: data.image,
        deliveryAddress: data.deliveryAddress,
        deliveryName: data.deliveryName,
        deliveryPhone: data.deliveryPhone,
        pincode: data.pincode,
        deliveryCity: data.deliveryCity,
        productCount: data.productCount,
        id: id,
      ),
    );
    getall();
  }

  Future<void> getall() async {
    final cancelDB = await Hive.openBox<Cancelorder>('cancel');
    cancelorderlist.value.clear();
    cancelorderlist.value.addAll(cancelDB.values);
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    cancelorderlist.notifyListeners();
  }
}
