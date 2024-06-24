import 'dart:io';

import 'package:firstproject/adminpanel/adminmodel/product_model.dart';
import 'package:firstproject/custom/product_name.dart';
import 'package:firstproject/funtions/dbfunction.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddproductPage extends StatefulWidget {
  const AddproductPage({super.key});

  @override
  State<AddproductPage> createState() => _AddproductPageState();
}

class _AddproductPageState extends State<AddproductPage> {
  var help = dbhelper();

  final _formKey = GlobalKey<FormState>();
  final _productnameController = TextEditingController();
  final _productprizeController = TextEditingController();
  final _productdisController = TextEditingController();

  String? _productCategory; 

  File? imageSelect;
  List<String> categories = [
    'Mens',
    'Womens',
    'Kids',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 189, 108, 102),
        title: Text(
          'Add Products',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 40),
                ProductName(productnameController: _productnameController),
                SizedBox(height: 20),
                ProductPrice(productpriceController: _productprizeController),
                SizedBox(height: 20),
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
                      _productCategory = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a category';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ProductDiscount(textEditingController: _productdisController),
                SizedBox(height: 30),
                Row(
                  children: [
                    SizedBox(width: 10),
                    Container(
                      child: imageSelect != null
                          ? Image.file(imageSelect!, fit: BoxFit.cover)
                          : const Icon(Icons.person),
                      height: 160,
                      width: 160,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            _pickcam();
                          },
                          icon: Icon(Icons.camera),
                        ),
                        SizedBox(height: 20),
                        IconButton(
                          onPressed: () {
                            _pickImage();
                          },
                          icon: Icon(Icons.photo),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 35),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.grey,
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      addButton();
                    }
                  },
                  child: Text('Save Item'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addButton() async {
    final name = _productnameController.text.trim();
    final price = _productprizeController.text.trim();
    final discount = _productdisController.text.trim();
    final category = _productCategory.toString();
    if (imageSelect == null) {
      return;
    }
    if (_formKey.currentState!.validate() &&
        name.isNotEmpty &&
        price.isNotEmpty &&
        discount.isNotEmpty &&
        category.isNotEmpty) {
      final add = Addproduct(
          name: name,
          price: price,
          category: category,
          discount: discount,
          image: imageSelect!.path.toString(),
          id: -1);
      help.save(add);
       showSnackBar(context, 'Added Succesfully!');
      _productnameController.clear();
    }else {
      showSnackBar(context, 'Product adding failed!');
      _productnameController.clear();
    }
  }
   void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
    ));
  }
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imageSelect = File(pickedFile.path);
      });
    }
  }
  Future<void> _pickcam() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        imageSelect = File(pickedFile.path);
      });
    }
  }
}
