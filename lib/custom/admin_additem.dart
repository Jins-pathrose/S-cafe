import 'package:firstproject/adminpanel/adminproduct/admin_products.dart';
import 'package:flutter/material.dart';

class AddminAdditem extends StatefulWidget {
  const AddminAdditem({super.key});

  @override
  State<AddminAdditem> createState() => _AddminAdditemState();
}

class _AddminAdditemState extends State<AddminAdditem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Color.fromARGB(255, 139, 133, 133)),
      child: ListTile(
        title: Text(
          'Add Items',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddproductPage()));
        },
      ),
    );
  }
}