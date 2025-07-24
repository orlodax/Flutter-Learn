import 'package:ecommerce_app/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  final List<Shoe> _allShoes = [
    Shoe(
      name: 'Athletic Running',
      description: 'Comfortable running shoes',
      price: 120,
      imagePath: 'lib/images/athletic-running-sneaker.png',
    ),
    Shoe(
      name: 'Budget Friendly',
      description: 'Lightweight and fast',
      price: 150,
      imagePath: 'lib/images/budget-friendly-sneaker.png',
    ),
    Shoe(
      name: 'Culture Podcast',
      description: 'Ultimate comfort for long runs',
      price: 180,
      imagePath: 'lib/images/sneaker-culture-podcasts.png',
    ),
    Shoe(
      name: 'Tech Innovation',
      description: 'Revolutionary design for athletes',
      price: 240,
      imagePath: 'lib/images/sneaker-tech-innovations.png',
    ),
  ];
  final List<Shoe> _userShoes = [];

  List<Shoe> get allShoes => _allShoes;
  List<Shoe> get userShoes => _userShoes;

  void addItem(Shoe shoe) {
    userShoes.add(shoe);
    notifyListeners();
  }

  void removeItem(Shoe shoe) {
    userShoes.remove(shoe);
    notifyListeners();
  }
}
