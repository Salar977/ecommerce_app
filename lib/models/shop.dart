import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/widgets.dart';

class Shop extends ChangeNotifier {
  // products for sale
  final List<Product> _shop = [
    Product(
      name: "Product 1",
      price: 99.99,
      description: "great product",
    ),
    Product(
      name: "Product 2",
      price: 49.99,
      description: "Another great product",
    ),
    Product(
      name: "Product 3",
      price: 29.99,
      description: "Affordable and reliable",
    ),
    Product(
      name: "Product 4",
      price: 199.99,
      description: "Premium quality item",
    ),
  ];

  // user cart
  List<Product> _cart = [];

  // getters for products and cart
  List<Product> get shop => _shop;
  List<Product> get cart => _cart;

  // add item to cart
  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  // remove item to cart
  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }
}
