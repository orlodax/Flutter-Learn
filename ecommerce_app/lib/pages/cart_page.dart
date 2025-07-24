import 'package:ecommerce_app/components/cart_item.dart';
import 'package:ecommerce_app/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cart header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Your Cart',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            // Cart items list
            Expanded(
              child: ListView.builder(
                itemCount: cart.userShoes.length,
                itemBuilder: (context, index) =>
                    CartItem(shoe: cart.userShoes[index]),
              ),
            ),

            // Total price
            Padding(
              padding: const EdgeInsets.all(16.0),
              // child: Text(
              //   'Total: \$${cart.totalPrice}',
              //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              // ),
            ),
          ],
        );
      },
    );
  }
}
