import 'package:ecommerce2_app/components/my_drawer.dart';
import 'package:ecommerce2_app/components/my_product_tile.dart';
import 'package:ecommerce2_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().productList;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Shop page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart_page'),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          // shop subtitle
          Center(
            child: Text(
              'Welcome to the shop!',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          // products list
          SizedBox(
            height: 550,
            child: ListView.builder(
              padding: const EdgeInsets.all(15.0),
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) =>
                  MyProductTile(product: products[index]),
            ),
          ),
        ],
      ),
    );
  }
}
