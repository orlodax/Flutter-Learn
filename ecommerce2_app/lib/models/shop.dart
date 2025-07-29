import 'package:ecommerce2_app/models/product.dart';
import 'package:flutter/foundation.dart';

class Shop extends ChangeNotifier {
  // products for sale
  final List<Product> _products = [
    Product(
      name: 'Wireless Headphones',
      price: 59.99,
      description: 'High-quality wireless headphones with noise cancellation.',
      imagePath: 'lib/assets/headphones.png',
    ),
    Product(
      name: 'Smart Watch',
      price: 129.99,
      description: 'Water-resistant smart watch with fitness tracking.',
      imagePath: 'lib/assets/watch.png',
    ),
    Product(
      name: 'Bluetooth Speaker',
      price: 39.99,
      description: 'Portable Bluetooth speaker with deep bass.',
      imagePath: 'lib/assets/speaker.png',
    ),
    Product(
      name: 'Fitness Tracker',
      price: 24.99,
      description: 'Lightweight fitness tracker with heart rate monitor.',
      imagePath: 'lib/assets/tracker.png',
    ),
  ];

  // user cart
  final List<Product> _cart = [];

  // get product list
  List<Product> get productList => _products;

  // get user cart
  List<Product> get userCart => _cart;

  // add item to cart
  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  // remove item from cart
  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }
}
