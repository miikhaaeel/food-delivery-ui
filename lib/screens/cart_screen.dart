import 'package:flutter/material.dart';
import 'package:food_delivery_ui/data/data.dart';
import 'package:food_delivery_ui/models/order.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  _buildCartItem(Order order) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      height: 170.0,
      child: Row(
        children: [
          Expanded(
            child: Row(
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
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.food.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -1.0,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          order.restaurant.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.black54,
                              width: 0.8,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Text(
                                order.quantity.toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: Text(
              '\$${order.quantity * order.food.price}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
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
          physics: const BouncingScrollPhysics(),
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