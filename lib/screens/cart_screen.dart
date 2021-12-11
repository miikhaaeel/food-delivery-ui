import 'package:flutter/material.dart';
import 'package:food_delivery_ui/data/data.dart';
import 'package:food_delivery_ui/models/order.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  _buildCartItem(Order order) {
    return Container(
      padding: EdgeInsets.all(20.0),
      height: 170.0,
      child: Row(
        children: [
          Row(
            children: [
              Container(
                width: 150.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(order.food.imageUrl),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Cart (${currentUser.cart.length})'),
      ),
      body: ListView.separated(
          //physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            Order order = currentUser.cart[index];
            return _buildCartItem(order);
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
