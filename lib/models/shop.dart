import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/widgets.dart';

class Shop extends ChangeNotifier {
  // products for sale
  final List<Product> _shop = [
    Product(
      name: "Football",
      price: 99.99,
      description: "High quality football",
      imagePath: "assets/football2.jpg",
    ),
    Product(
      name: "Football shoes",
      price: 149.99,
      description: "Comfortable and durable shoes",
      imagePath: "assets/footballshoes.png",
    ),
    Product(
      name: "Glasses",
      price: 49.99,
      description: "Stylish sunglasses",
      imagePath: "assets/glasses.jpg",
    ),
    Product(
      name: "Hoodie",
      price: 79.99,
      description: "Warm and cozy hoodie",
      imagePath: "assets/hoodie.jpg",
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
