import 'package:flutter/material.dart';
import 'data/mock_products.dart';
import 'models/product_model.dart';

class MockJsonScreen extends StatefulWidget {
  const MockJsonScreen({super.key});

  @override
  State<MockJsonScreen> createState() => _MockJsonScreenState();
}

class _MockJsonScreenState extends State<MockJsonScreen> {
  late List<ProductModel> products;

  @override
  void initState() {
    super.initState();

    products = mockProducts
        .map((json) => ProductModel.fromJson(json))
        .toList();
  }

  void filterMobiles() {
    setState(() {
      products = mockProducts
          .map((json) => ProductModel.fromJson(json))
          .where((product) => product.category == 'Mobile')
          .toList();
    });
  }

  void sortByPriceLowToHigh() {
    setState(() {
      products.sort((a, b) => a.price.compareTo(b.price));
    });
  }

  void resetProducts() {
    setState(() {
      products = mockProducts
          .map((json) => ProductModel.fromJson(json))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mock JSON Filter & Sort'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Wrap(
              spacing: 8,
              children: [
                ElevatedButton(
                  onPressed: filterMobiles,
                  child: const Text('Filter Mobile'),
                ),
                ElevatedButton(
                  onPressed: sortByPriceLowToHigh,
                  child: const Text('Sort Price'),
                ),
                ElevatedButton(
                  onPressed: resetProducts,
                  child: const Text('Reset'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];

                  return Card(
                    child: ListTile(
                      title: Text(product.name),
                      subtitle: Text(
                        '${product.category} • Rating: ${product.rating}',
                      ),
                      trailing: Text('₹${product.price}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}