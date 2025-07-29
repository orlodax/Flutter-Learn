import 'package:ecommerce2_app/components/my_button.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),

            //title
            const Text(
              'Minimal Shop',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            // subtitle
            Text(
              'Your one-stop shop for minimalistic designs',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 25),

            // button
            MyButton(
              child: Icon(Icons.arrow_back),
              onTap: () {
                Navigator.pushNamed(context, '/shop_page');
              },
            ),
          ],
        ),
      ),
    );
  }
}
