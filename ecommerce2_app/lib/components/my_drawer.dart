import 'package:ecommerce2_app/components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.shopping_bag,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  size: 72,
                ),
              ),

              const SizedBox(height: 25),

              MyListTile(
                text: 'Shop',
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),

              MyListTile(
                text: 'Cart',
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: 'Exit',
              icon: Icons.logout,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/intro_page');
              },
            ),
          ),
        ],
      ),
    );
  }
}
