import 'package:flutter/material.dart';
import '../models/product.dart';

class ReportPage extends StatelessWidget {

  final List<Product> cart;

  const ReportPage({
    super.key,
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {

    double total = 0;

    for (var item in cart) {
      total += item.price;
    }

    double average =
    cart.isEmpty ? 0 : total / cart.length;

    Product max =
    cart.reduce((a, b) =>
    a.price > b.price ? a : b);

    Product min =
    cart.reduce((a, b) =>
    a.price < b.price ? a : b);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Report"),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Text("Total Belanja : Rp $total"),

              const SizedBox(height: 10),

              Text(
                "Rata-rata Harga : Rp ${average.toStringAsFixed(2)}",
              ),

              const SizedBox(height: 10),

              Text(
                "Barang Termahal : ${max.name}",
              ),

              Text(
                "Harga : Rp ${max.price}",
              ),

              const SizedBox(height: 10),

              Text(
                "Barang Termurah : ${min.name}",
              ),

              Text(
                "Harga : Rp ${min.price}",
              ),
            ],
          ),
        ),
      ),
    );
  }
}