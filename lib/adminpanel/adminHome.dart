import 'package:firstproject/adminpanel/adminproduct/product_list.dart';
import 'package:firstproject/custom/adminadditem.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin Home',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 189, 108, 102),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(28),
            child: Column(
              children: [
                Image.asset(
                  'assets/Scafe_Logo-removebg-preview.png',
                  height: 80,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'S',
                        style: TextStyle(
                          color: Color.fromARGB(255, 17, 56, 78),
                          fontWeight: FontWeight.w500,
                          fontSize: 60,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: " 'CAFE",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 50,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                AddminAdditem(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
          color: Color.fromARGB(255, 139, 133, 133)),
                  child: ListTile(
                    title: Text(
                      'Product List',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductList()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
