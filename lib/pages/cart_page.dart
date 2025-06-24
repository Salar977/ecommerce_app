import 'package:ecommerce_app/components/my_button.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // remove from cart
  void removeFromCart(BuildContext context, Product product) {
    // show a dialog box to ask user to confirm to remove to cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Remove this item from your cart?'),
        actions: [
          // cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),

          // confirm button
          MaterialButton(
            onPressed: () {
              // pop the box
              Navigator.pop(context);

              // remove to cart
              context.read<Shop>().removeFromCart(product);
            },
            child: Text('Yes'),
          )
        ],
      )
    );
  }

  // pay button pressed
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text('User wants to pay! Connect this app to your payment solution'),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    // get access to the cart
    final cart = context.watch<Shop>().cart;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Cart Page'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          // cart list

          Expanded(
            child: cart.isEmpty ? const Center(child: Text('Empty Cart.')) : ListView.builder(
              itemCount: cart.length,
              itemBuilder:(context, index) {
                // get individual item in cart
                final item = cart[index];

                // return as a list tile
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.price.toStringAsFixed(2)),
                  trailing: IconButton(
                    onPressed: () => removeFromCart(context, item),
                    icon: const Icon(Icons.delete)
                  ),
                );
              },
            ),
          ),

          // pay button
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              childWidget: const Text('Pay Now'),
            ),
          )
        ],
      ),
    );
  }
}