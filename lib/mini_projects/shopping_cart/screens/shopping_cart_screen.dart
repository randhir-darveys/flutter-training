import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(name: 'iPhone 15', price: 79999),
      Product(name: 'MacBook Air', price: 99999),
      Product(name: 'Sony Headphones', price: 14999),
      Product(name: 'Apple Watch', price: 45999),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Text(
                'Items: ${context.watch<CartProvider>().itemCount}',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return Card(
                  child: ListTile(
                    title: Text(product.name),
                    subtitle: Text('₹${product.price}'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        context.read<CartProvider>().addToCart(product);
                      },
                      child: const Text('Add'),
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Total: ₹${context.watch<CartProvider>().totalPrice}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    context.read<CartProvider>().clearCart();
                  },
                  child: const Text('Clear Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// Explanation:
//
// Isme:
//
// context.watch<CartProvider>() UI update ke liye use hua
// context.read<CartProvider>() actions ke liye use hua
// app bar me live cart count
// total price auto update
// clear cart functionality