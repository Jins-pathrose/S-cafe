

import 'package:firstproject/funtions/cancel.dart';
import 'package:firstproject/models/cancelorder.dart';
import 'package:flutter/material.dart';

cancelHelper cncl = cancelHelper();

Future<void> cancelbutton(ordercancel, BuildContext context) async {
  final cancel = Cancelorder(
      name: ordercancel!.productName,
      price: ordercancel.productPrice,
      size: ordercancel.productsize,
      image: ordercancel.productImage,
      deliveryAddress: ordercancel.deliveryAddress,
      deliveryName: ordercancel.deliveryName,
      deliveryPhone: ordercancel.deliveryPhone,
      pincode: ordercancel.pincode,
      productCount: ordercancel.productCount.toString(),
      id: ordercancel.id, 
      deliveryCity: ordercancel.deliveryCity);
      cncl.cancelthisorder(cancel);
      cncl.getall();

}