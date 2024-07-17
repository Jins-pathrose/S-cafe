import 'package:firstproject/funtions/cancel_button.dart';
import 'package:firstproject/funtions/order_function.dart';
import 'package:firstproject/models/order.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

void cancel(BuildContext context, int? id, orderdetail) {
  showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Text('Cancel order'),
      content: Text('Do you want to cancel'),
      actions: [
        ElevatedButton(onPressed: () {
          conformcancel(context, id);
          cancelbutton(orderdetail, context);
       
        }, child: Text('Yes')),
        ElevatedButton(onPressed: () {
          Navigator.pop(context);
        }, child: Text('No'))
      ],
    );
  });
}

Future<void> conformcancel(context, int? id) async {
  final cancel = await Hive.openBox<Oredrplace>('order');
  cancel.delete(id);
  getorder();
  Navigator.pop(context);
}