import 'package:flutter/material.dart';

class KidsPage extends StatefulWidget {
  const KidsPage({super.key});

  @override
  State<KidsPage> createState() => _KidsPageState();
}

class _KidsPageState extends State<KidsPage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: const Color.fromARGB(255, 189, 108, 102),
      body: Center( 
        child: Text('Kids Page'),
      ),
    );
  }
}