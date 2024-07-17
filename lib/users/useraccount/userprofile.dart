import 'dart:io';

import 'package:firstproject/models/user_login.dart';
import 'package:firstproject/users/useraccount/edit_userprofile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userEmail = '';
  User? currentUser;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userEmail = prefs.getString('currentUser') ?? '';

    final userBox = await Hive.openBox<User>('users');
    currentUser = userBox.values.firstWhere(
      (user) => user.email == userEmail,
    );

    print('${currentUser!.image}');

    setState(() {
      // Trigger UI update
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 189, 108, 102),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfileScreen(currentUser: currentUser)));
            },
            icon: Icon(Icons.edit),
          )
        ],
      ),
      body: currentUser != null
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: 600,
                    color: const Color.fromARGB(255, 221, 221, 221),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: CircleAvatar(
                            radius: 150,
                            backgroundImage: FileImage(File(currentUser!.image)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.person,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        title: Text("${currentUser!.name}"),
                      ),Divider(),
                      ListTile(
                        leading: Icon(
                          Icons.email,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        title: Text("${currentUser!.email}"),
                      ),Divider(),
                      ListTile(
                        leading: Icon(
                          Icons.phone_iphone_rounded,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        title: Text("${currentUser!.phone}"),
                      ),Divider(),
                    ],
                  ),
                ],
              ),
            )
          : Center(
              child: Column(
                children: [
                  SizedBox(height: 200),
                  Text("USER NOT LOGGED IN"),
                  TextButton(
                    onPressed: () {
                      // Navigate to login screen
                    },
                    child: Text("PROCEED TO LOGIN"),
                  )
                ],
              ),
            ),
    );
  }
}
