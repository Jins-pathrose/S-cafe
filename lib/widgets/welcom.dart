// import 'package:firstproject/admin/adminlogin.dart';
import 'package:firstproject/adminpanel/adminlogin.dart';
import 'package:firstproject/widgets/login.dart';
import 'package:firstproject/widgets/register.dart';
import 'package:flutter/material.dart';

class Welcompage extends StatefulWidget {
  const Welcompage({super.key});

  @override
  State<Welcompage> createState() => _WelcompageState();
}

class _WelcompageState extends State<Welcompage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 189, 108, 102),
      body: Padding(
        padding: const EdgeInsets.only(left: 90, top: 150),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'GOOD SHOES',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30),
            ),
            Text(
              'TAKES YOU',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30),
            ),
            Text(
              'GOOD PLACES',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30),
            ),
            Image.asset(
              'assets/Scafe_Logo-removebg-preview.png',
              width: 200,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 50),
              child: GestureDetector(
                onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                },
                child: Container(
                  
                  width: 150,
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 171, 168, 168),
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 30),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                },
                child: Container(
                  width: 150,
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 171, 168, 168),
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'LOG IN',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),SizedBox(height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminLogin()));
                    },
                    child: Text("Admin Login",style: TextStyle(fontSize: 18,color: const Color.fromARGB(255, 255, 255, 255)),)),
              ],
            )
          ],
          
        ),
        
      ),
      
    );
  }
}
