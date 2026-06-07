import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAdd;

  const ProductCard({
    super.key,
    required this.product,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Image.asset(
              product.image,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),

            Text(
              product.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            Text("Rp ${product.price}"),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: onAdd,
              child: const Text("Tambah"),
            )
          ],
        ),
      ),
    );
  }
}