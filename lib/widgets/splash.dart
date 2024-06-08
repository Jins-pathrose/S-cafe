import 'package:firstproject/users/bottom.dart';
import 'package:firstproject/widgets/welcom.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUserLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 189, 108, 102),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 290),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Image.asset(
                  'assets/Scafe_Logo-removebg-preview.png',
                  width: 100,
                  height: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Row(
                  children: [
                    Text(
                      "S",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 70),
                    ),
                    Text(
                      "'CAFE",
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 50),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> gotoLogin(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => Welcompage()));
  }

  Future<void> checkUserLogin() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final userLoggedIn = sharedPrefs.getBool("saveUserEmail") ?? false;
    
    if (userLoggedIn) {
      await Future.delayed(Duration(seconds: 2));  
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) =>BottomPage()));
    } else {
      gotoLogin(context);
    }
  }
}
