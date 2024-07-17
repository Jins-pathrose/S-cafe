
import 'dart:io';

import 'package:firstproject/custom/profile_extract.dart';
import 'package:firstproject/main.dart';
import 'package:firstproject/models/user_login.dart';
import 'package:firstproject/users/order_screens/order_details.dart';
import 'package:firstproject/users/order_screens/orderscreen.dart';
import 'package:firstproject/widgets/login.dart';
import 'package:firstproject/widgets/register.dart';
import 'package:firstproject/widgets/welcom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String useremail = '';
  User? currentUser;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    useremail = prefs.getString('currentUser') ?? '';
    final userBox = await Hive.openBox<User>('users');
    currentUser = userBox.values.firstWhere(
      (user) => user.email == useremail,
    );
    setState(() {
      getall2();
    });
  }

  void Logoutbox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('Logout'),
              content: Text('You Want Logout application'),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Logouting(context);
                    },
                    child: Text('YES')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('NO')),
              ]);
        });
  }

  void Logouting(BuildContext ctx) async {
    Navigator.pushAndRemoveUntil(
        ctx,
        MaterialPageRoute(builder: (context) => Welcompage()),
        (route) => false);
    final shared = await SharedPreferences.getInstance();
    shared.setBool(SAVE_KEY_NAME, false);
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(microseconds: 1), () {
      setState(() {});
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(189, 108, 102, 1),
        title: Text("Account", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 260,
              decoration: BoxDecoration(
                color: Color.fromRGBO(227, 224, 224, 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: currentUser != null &&
                            currentUser!.image != null &&
                            File(currentUser!.image).existsSync()
                        ? FileImage(File(currentUser!.image))
                        : null
                  ),
                  Text("${currentUser?.name}"),
                  SizedBox(height: 2.5),
                  Text(''),
                ],
              ),
            ),
            profile(),
                        about(),

             termsandcondition(), 
          
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(18)),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OrderScreen()));
                  },
                  leading: Icon(
                    Icons.badge,
                    color: Colors.black,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  title: Text(
                    'My Orders',
                    style: GoogleFonts.poppins(
                        color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(18)),
                child: ListTile(
                  onTap: () {
                    Logoutbox(context);
                  },
                  leading: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Sign Out',
                    style: GoogleFonts.poppins(
                        color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
