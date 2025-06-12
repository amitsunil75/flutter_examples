import 'dart:async';

import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final int stock;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
  });
}


class ProductService {
  final _controller = StreamController<List<Product>>.broadcast();

  ProductService() {
    // Simulate stock changes every 3 seconds
    Timer.periodic(const Duration(seconds: 3), (_) {
      _controller.add(_generateFakeProducts());
    });
  }

  Stream<List<Product>> getProductStream() => _controller.stream;

  List<Product> _generateFakeProducts() {
    return [
      Product(id: '1', name: 'Laptop', price: 899.99, stock: _randomStock()),
      Product(id: '2', name: 'Phone', price: 499.99, stock: _randomStock()),
      Product(id: '3', name: 'Headphones', price: 59.99, stock: _randomStock()),
    ];
  }

  int _randomStock() => 1 + DateTime.now().second % 5;
}
class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productService = ProductService();

    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: StreamBuilder<List<Product>>(
        stream: productService.getProductStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

          final products = snapshot.data!;
          return ListView.builder(
            key: const PageStorageKey('productList'),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                title: Text(product.name),
                subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                trailing: Text('Stock: ${product.stock}'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailPage(product: product),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}



class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Price: \$${product.price}'),
            const SizedBox(height: 10),
            Text('Available Stock: ${product.stock}'),
            const Spacer(),
            ElevatedButton(
              onPressed: product.stock > 0 ? () {} : null,
              child: const Text('Add to Cart'),
            )
          ],
        ),
      ),
    );
  }
}
