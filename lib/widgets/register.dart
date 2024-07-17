

import 'dart:io';

import 'package:firstproject/custom/signup_custom.dart';
import 'package:firstproject/models/user_login.dart';
import 'package:firstproject/widgets/login.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

ValueNotifier<List<User>> userslist = ValueNotifier([]);

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? _selectedImage;
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String? _validateEmail(String? value) {
    String emailRegex = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+$';
    RegExp regex = RegExp(emailRegex);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validateName(String? value) {
    String nameRegex = r'^[a-zA-Z ]+$';
    RegExp regex = RegExp(nameRegex);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid name';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    String phoneRegex = r'^[0-9]{10}$';
    RegExp regex = RegExp(phoneRegex);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    String passwordRegex = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$';
    RegExp regex = RegExp(passwordRegex);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Password must be at least 6 characters long and contain at least one uppercase letter, one lowercase letter, and one digit';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 208, 137, 132),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 0,
                  width: 500,
                ),
                const Text(
                  'Register',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40),
                ),
                InkWell(
                  onTap: _selectedImage1,
                  child: CircleAvatar(
                    radius: 90,
                    backgroundImage: _selectedImage != null
                        ? FileImage(File(_selectedImage!))
                        : null,
                    child: _selectedImage == null ? const Text('Add photo') : null,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: _validateEmail,
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: _validateName,
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  keyboardType: TextInputType.number,
                  validator: _validatePhoneNumber,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: _validatePassword,
                ),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,
                  validator: _validateConfirmPassword,
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      if (_selectedImage == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select an image'),
                          ),
                        );
                        return;
                      }
                      signup(
                        _nameController.text,
                        _phoneController.text,
                        context,
                        _emailController.text,
                        _passwordController.text,
                        _selectedImage!,
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    }
                  },
                  child: Container(
                    width: 150,
                    height: 45,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 171, 168, 168),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _selectedImage1() async {
    final selectedimg1 = await picker.pickImage(source: ImageSource.gallery);
    if (selectedimg1 != null) {
      setState(() {
        _selectedImage = selectedimg1.path;
      });
    }
  }

  void signup(String name, String phone, BuildContext context, String email,
      String password, String image) async {
    await Hive.openBox<User>('users');
    final usersBox = await Hive.openBox<User>('users');
    final userExists = usersBox.values.any((user) => user.email == email);
    if (userExists) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('User already exists'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      final user = User(
        name: name,
        phone: phone,
        email: email,
        password: password,
        image: image,
        id: -1,
      );
      usersBox.add(user);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Account created successfully'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      getall2();
    }
  }
}

Future<void> getall2() async {
  final save = await Hive.openBox<User>('users');
  userslist.value.clear();
  userslist.value.addAll(save.values);
  userslist.notifyListeners();
}
