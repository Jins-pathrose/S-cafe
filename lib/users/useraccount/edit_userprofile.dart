
import 'dart:io';

import 'package:firstproject/models/user_login.dart';
import 'package:firstproject/users/bottom.dart';
import 'package:firstproject/users/useraccount/account_screen.dart';
import 'package:firstproject/users/useraccount/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  final User? currentUser;

  const EditProfileScreen({Key? key, required this.currentUser})
      : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? _selectedImage;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    // Initialize text controllers with current user data
    nameController.text = widget.currentUser!.name;
    emailController.text = widget.currentUser!.email;
    phoneController.text = widget.currentUser!.phone; // Ensure correct initialization
    _selectedImage = widget.currentUser!.image;
  }

  void _selectImage() async {
    final selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      setState(() {
        _selectedImage = selectedImage.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(189, 108, 102, 1),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.restore),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InkWell(
              onTap: _selectImage,
              child: CircleAvatar(
                radius: 90,
                backgroundImage: _selectedImage != null ? FileImage(File(_selectedImage!)) : null,
                child: _selectedImage == null ? Image.asset('images/prf.jpeg') : null,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Save the edited profile data
          updateProfile(
            _selectedImage!,
            nameController.text,
            emailController.text,
            phoneController.text,
          );
          // Pop the screen to go back to the profile screen
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomPage()));
        },
        child: Icon(Icons.save),
      ),
    );
  }

  void updateProfile(String imagePath, String newName, String newEmail, String newPhone) {
    // Assuming you have a Hive box for users
    final userBox = Hive.box<User>('users');

    // Get the current user from the box
    User currentUser = userBox.values.firstWhere(
      (user) => user.email == widget.currentUser!.email,
    );

    // Update the user's profile information
    currentUser.image = imagePath;
    currentUser.name = newName;
    currentUser.email = newEmail;
    currentUser.phone = newPhone;

    // Save the updated user back to the box
    userBox.put(currentUser.key, currentUser);

    // If needed, you can also update the widget.currentUser with the new information
    widget.currentUser!.image = imagePath;
    widget.currentUser!.name = newName;
    widget.currentUser!.email = newEmail;
    widget.currentUser!.phone = newPhone;
  }
}
