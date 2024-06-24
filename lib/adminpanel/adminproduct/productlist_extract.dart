import 'dart:io';

import 'package:firstproject/adminpanel/adminmodel/product_model.dart';
import 'package:firstproject/custom/custom_text.dart';
import 'package:flutter/material.dart';

class productlistimage extends StatelessWidget {
  const productlistimage({
    super.key,
    required this.imagePath,
  });
  final String? imagePath;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      child: Container(
        width: 149,
        height: 201,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: imagePath != null
            ? Image.file(File(imagePath!))
            : Placeholder(),
      ),
    );
    }
    }
    class productlistname extends StatelessWidget {
  const productlistname({
    super.key,
    required this.product,
  });

  final Addproduct product;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 173,
      top: 15,
      child: customeText(
        texts: "${product.name}",
        textcolor: Colors.black,
        textsize: 18,
        textweight: FontWeight.w800,
        textspace: 1.80,
      ),
    );
  }
}
class productlistprize extends StatelessWidget {
  const productlistprize({
    super.key,
    required this.product,
  });

  final Addproduct product;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 173,
      top: 80,
      child: customeText(
        texts: "₹${product.price}",
        textcolor: Color.fromARGB(255, 65, 216, 0),
        textsize: 18,
        textweight: FontWeight.w800,
        textspace: 1.80,
      ),
    );
  }
}
class productlistdiscount extends StatelessWidget {
  const productlistdiscount({
    super.key,
    required this.product,
  });

  final Addproduct product;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 173,
      top: 45,
      child: customeText(
        texts: "%${product.discount} Discount",
        textcolor: Color.fromARGB(255, 254, 3, 3),
        textsize: 18,
        textweight: FontWeight.w800,
        textspace: 1.80,
      ),
    );
  }
}