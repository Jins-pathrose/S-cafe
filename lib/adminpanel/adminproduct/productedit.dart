
import 'dart:io';

import 'package:firstproject/adminpanel/adminmodel/product_model.dart';
import 'package:firstproject/funtions/dbfunction.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class ProductEdit extends StatefulWidget {
  final product;
  final int id;
  final int index;
  const ProductEdit({
    super.key,
    required this.product,
    required this.index,
    required this.id,
  });

  @override
  State<ProductEdit> createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _productName;
  late TextEditingController _productPrice;
  late TextEditingController _producdis;
  late String _productCategory;
  String? _selectedImage;
  dbhelper dbh = dbhelper();

  @override
  void initState() {
    super.initState();
    _productName = TextEditingController(text: widget.product.name);
    _productPrice = TextEditingController(text: widget.product.price);
    _producdis = TextEditingController(text: widget.product.discount);

    // Ensure the initial category value is valid
    if (categories.contains(widget.product.category)) {
      _productCategory = widget.product.category;
    } else {
      _productCategory = categories.first; // Set a default value if invalid
    }
  }

  List<String> categories = [
    'Men',
    'Women',
    'Kids',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 208, 137, 132),
        title: const Text('Edit your product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: _selectImage1,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: _selectedImage != null
                          ? Image.file(
                              File(_selectedImage!),
                              fit: BoxFit.cover,
                            )
                          : (widget.product.image.isNotEmpty
                              ? Image.file(File(widget.product.image))
                              : Container()),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _productName,
                    decoration: const InputDecoration(
                      labelText: 'Product Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a product name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: _productCategory,
                    decoration: const InputDecoration(
                      fillColor: Color(0xABFFFEFE),
                      labelText: 'Product Category',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                    ),
                    items: categories.map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _productCategory = value!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a category';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _productPrice,
                    decoration: const InputDecoration(
                      labelText: 'Product Price',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a price';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid price';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _producdis,
                    decoration: const InputDecoration(
                      labelText: 'Product Discount',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a discount';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid discount';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 4, 4, 4),
                      ),
                      foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        widget.product.name = _productName.text;
                        widget.product.category = _productCategory;
                        widget.product.price = _productPrice.text;
                        widget.product.discount = _producdis.text;

                        if (_selectedImage != null) {
                          widget.product.image = _selectedImage;
                        }

                        _updateProduct();

                        setState(() {});
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Save Changes'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _selectImage1() async {
    final selectedimg1 =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (selectedimg1 != null) {
      setState(() {
        _selectedImage = selectedimg1.path;
      });
    }
  }

  Future<void> _updateProduct() async {
    final updateBox = await Hive.openBox<Addproduct>('dbname');

    await updateBox.put(widget.id, widget.product);
    productlist.notifyListeners();
  }
}
