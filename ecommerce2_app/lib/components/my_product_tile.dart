import 'package:ecommerce2_app/models/product.dart';
import 'package:ecommerce2_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;

  const MyProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(25.0),
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // product image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset(product.imagePath),
                ),
              ),

              const SizedBox(height: 25),

              // product name
              Text(
                product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 10),

              // product description
              Text(
                product.description,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          // product price + add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${product.price.toStringAsFixed(2)}'),

              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: const Icon(Icons.add_shopping_cart),
                  onPressed: () => addToCart(context, product),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void addToCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Add this product to your cart?'),
        actions: [
          MaterialButton(
            onPressed: () {
              context.read<Shop>().addToCart(product);
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
}
