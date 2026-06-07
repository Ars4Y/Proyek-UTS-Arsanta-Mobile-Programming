import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/product_service.dart';
import '../widgets/product_card.dart';
import 'cart_page.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {

  final ProductService service = ProductService();

  List<Product> cart = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SmartCart"),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CartPage(cart: cart),
                    ),
                  );
                },
              ),

              Positioned(
                right: 5,
                top: 5,
                child: CircleAvatar(
                  radius: 10,
                  child: Text(
                    cart.length.toString(),
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              )
            ],
          )
        ],
      ),

      body: SafeArea(
        child: FutureBuilder<List<Product>>(
          future: service.loadProducts(),
          builder: (context, snapshot) {

            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final products = snapshot.data!;

            return GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.80,
              ),
              itemBuilder: (context, index) {

                return ProductCard(
                  product: products[index],
                  onAdd: () {

                    setState(() {
                      cart.add(products[index]);
                    });

                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      SnackBar(
                        content: Text(
                          "${products[index].name} ditambahkan",
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}