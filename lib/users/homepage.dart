import 'package:firstproject/users/kids.dart';
import 'package:firstproject/users/mens.dart';
import 'package:firstproject/users/womens.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 189, 108, 102),
       body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      // Navigator.push(context, (MaterialPageRoute(builder: (context)=>HomePage())));
                    },
                    child: Text(
                      'All',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, (MaterialPageRoute(builder: (context)=>MensPage())));
                    },
                    child: Text(
                      'Mens',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, (MaterialPageRoute(builder: (context)=>WomensPage())));
                    },
                    child: Text(
                      'Womens',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, (MaterialPageRoute(builder: (context)=>KidsPage())));
                    },
                    child: Text(
                      'Kids',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 360,
              height: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 255, 255, 255)),
            ),
            SizedBox(
              height: 20,
            ),
            GridView.builder(
              shrinkWrap: true, // Makes the GridView fit its children
              physics:
                  NeverScrollableScrollPhysics(), // Prevents the GridView from scrolling
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
              ),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Item $index',
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Shoe name '),
                            Text('Rate $index'),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}