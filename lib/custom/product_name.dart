import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductName extends StatefulWidget {
  final TextEditingController productnameController;
  const ProductName({super.key, required this.productnameController});

  @override
  State<ProductName> createState() => _ProductNameState();
}

class _ProductNameState extends State<ProductName> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.productnameController, // Use the passed controller
      validator: (value) {
        final trimmedValue = value?.trim();
        if (trimmedValue == null || trimmedValue.isEmpty) {
          return 'Enter product name';
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        prefixIcon: Icon(Icons.abc),
        label: Text(
          'Add Product Name',
          style: GoogleFonts.inter(color: Colors.black),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
class ProductPrice extends StatefulWidget {
  final TextEditingController productpriceController;
  const ProductPrice({super.key, required this.productpriceController});

  @override
  State<ProductPrice> createState() => _ProductPriceState();
}

class _ProductPriceState extends State<ProductPrice> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.productpriceController, // Use the passed controller
      validator: (value) {
        final trimmedValue = value?.trim();
        if (trimmedValue == null || trimmedValue.isEmpty) {
          return 'Enter product price';
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
        prefixIcon: Icon(Icons.attach_money),
        label: Text(
          'Add Product Price',
          style: GoogleFonts.inter(color: Colors.black),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
class ProductDiscount extends StatefulWidget {
  final TextEditingController textEditingController;

  const ProductDiscount({required this.textEditingController, Key? key}) : super(key: key);

  @override
  State<ProductDiscount> createState() => _ProductDiscountState();
}

class _ProductDiscountState extends State<ProductDiscount> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
       validator: (value) {
        final trimmedValue = value?.trim();
        if (trimmedValue == null || trimmedValue.isEmpty) {
          return 'Enter discount';
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
        label: Text(
          'Add Discount',
          style: GoogleFonts.inter(color: Colors.black),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
