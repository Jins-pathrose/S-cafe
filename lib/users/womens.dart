import 'package:flutter/material.dart';

class WomensPage extends StatefulWidget {
  const WomensPage({super.key});

  @override
  State<WomensPage> createState() => _WomensPageState();
}

class _WomensPageState extends State<WomensPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 189, 108, 102),
      body: Center( 
        child: Text('Womens Page'),
      ),
    );
  }
}