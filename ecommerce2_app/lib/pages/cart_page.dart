import 'package:ecommerce2_app/components/my_button.dart';
import 'package:ecommerce2_app/models/product.dart';
import 'package:ecommerce2_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> cart = context.watch<Shop>().userCart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cart Page'),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
                ? Center(child: const Text('Your cart is empty'))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final product = cart[index];
                      return ListTile(
                        title: Text(product.name),
                        subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                        trailing: IconButton(
                          onPressed: () => removeItemFromCart(context, product),
                          icon: const Icon(Icons.delete_outline),
                        ),
                      );
                    },
                  ),
          ),

          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              child: Text('Checkout'),
              onTap: () => payButtonPressed(context),
            ),
          ),
        ],
      ),
    );
  }

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Remove this product from your cart?'),
        actions: [
          MaterialButton(
            onPressed: () {
              context.read<Shop>().removeFromCart(product);
              Navigator.of(context).pop();
            },
            child: const Text('Yes'),
          ),
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('No'),
          ),
        ],
      ),
    );
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          content: Text('Have you considered implementing a payment system?'),
        );
      },
    );
  }
}
