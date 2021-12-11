import 'package:flutter/material.dart';
import 'package:food_delivery_ui/data/data.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart (${currentUser.cart.length})'),
      ),
      body: ListView.separated(
          //physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10.0),
              color: Colors.red,
              height: 100.0,
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.grey,
              height: 1.0,
            );
          },
          itemCount: currentUser.cart.length),
    );
  }
}
