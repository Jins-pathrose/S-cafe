import 'package:firstproject/users/cartScreen.dart';
import 'package:firstproject/users/favourite.dart';
import 'package:firstproject/users/homepage.dart';
import 'package:firstproject/users/profile.dart';
import 'package:firstproject/users/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({super.key});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int indexNum = 0;
  List screen = [
    HomeScreen(),
    CartScreen(),
    SearchPage(),
    FavScreen(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 189, 108, 102),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10), // Adjust the radius as needed
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 214, 210, 210),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SizedBox(
              width: 5,
            ),
            Text(
              "S",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
            ),
            Text(
              "'CAFE",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
            ),
            SizedBox(
              width: 220,
            ),
            Image.asset(
              'assets/Scafe_Logo-removebg-preview.png',
              width: 50,
              height: 50,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.trolley,
            ),
            label: 'Carts',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.heart_fill,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: indexNum,
        showSelectedLabels: true,
        onTap: (int index) {
          setState(() {
            indexNum = index;
          });
        },
        iconSize: 30,
        showUnselectedLabels: true,
        selectedItemColor: Color.fromARGB(255, 255, 0, 0),
        unselectedItemColor: const Color.fromARGB(255, 68, 68, 68),
      ),
      body: screen.elementAt(indexNum),
    );
  }
}
