import 'package:firstproject/adminpanel/adminorder/admin_orderscreen.dart';
import 'package:firstproject/users/order_screens/order_cancel.dart';
import 'package:flutter/material.dart';

class OrderMain extends StatefulWidget {
  const OrderMain({super.key});

  @override
  State<OrderMain> createState() => _OrderMainState();
}

class _OrderMainState extends State<OrderMain> {
  icon() => null;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 208, 137, 132),
          title: Text("Orders"),
          centerTitle: true,
          bottom: TabBar(tabs: const [
            Tab(child: Text('Order')),
            Tab(child: Text('Cancel'))
          ]),
          
        ),
        body: TabBarView(
              children: const [
                 OrdersScreenpage(),
                CancelDetails(), 
              ],)
      
      ),
    );
  }
}