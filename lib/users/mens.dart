import 'package:flutter/material.dart';

class MensPage extends StatefulWidget {
  const MensPage({super.key});

  @override
  State<MensPage> createState() => _MensPageState();
}

class _MensPageState extends State<MensPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 189, 108, 102),
      body: Center( 
        child: Text('Mens Page'),
      ),
    );
  }
}