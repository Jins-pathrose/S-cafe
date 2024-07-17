import 'package:firstproject/adminpanel/adminorder/admin_order.dart';
import 'package:flutter/material.dart';

class adminhomeorderdeteail extends StatelessWidget {
  const adminhomeorderdeteail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Color.fromARGB(255, 139, 133, 133)),
      // clipBehavior: Clip.antiAlias,
      child: ListTile(
        title: Text(
          'Orders Details',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => OrderMain()));
        },
      ),
    );
  }
}