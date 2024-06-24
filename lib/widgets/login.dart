

import 'package:firstproject/custom/login_custom.dart';
import 'package:firstproject/models/user_login.dart';
import 'package:firstproject/users/homepage.dart';
import 'package:firstproject/widgets/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

const SAVE_KEY_NAME = 'saveUserEmail';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 188, 187, 187)
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.all(30.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: GoogleFonts.rubik(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 30),
                  logintextemail(emailController: emailController),
                  SizedBox(height: 20),
                  logintextpassword(passwordController: passwordController),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        login(
                          emailController.text,
                          passwordController.text,
                          context,
                        );
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'New to here?',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()),
                          );
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login(String email, String password, BuildContext context) async {
    final usersBox = await Hive.openBox<User>('users');
    User? user;
    for (var i = 0; i < usersBox.length; i++) {
      final currentUser = usersBox.getAt(i);
      if (currentUser?.email == email && currentUser?.password == password) {
        user = currentUser;
        break;
      }
    }
    if (user != null) {
      final sharedprefs = await SharedPreferences.getInstance();
      sharedprefs.setBool(SAVE_KEY_NAME, true);
      sharedprefs.setString('currentUser', email);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (home) => HomeScreen()), (route) => false);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Invalid email or password'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
    }
  }
}
