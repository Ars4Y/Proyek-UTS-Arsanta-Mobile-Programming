import 'package:flutter/material.dart';
import '../models/product.dart';
import 'report_page.dart';

class CartPage extends StatefulWidget {
  final List<Product> cart;

  const CartPage({
    super.key,
    required this.cart,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<Product> cartItems;

  @override
  void initState() {
    super.initState();
    cartItems = List.from(widget.cart);
  }

  double getTotal() {
    double total = 0;

    for (var item in cartItems) {
      total += item.price;
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: cartItems.isEmpty
                  ? const Center(
                child: Text(
                  "Keranjang masih kosong",
                  style: TextStyle(fontSize: 18),
                ),
              )
                  : ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.shopping_bag,
                      ),
                      title: Text(
                        cartItems[index].name,
                      ),
                      subtitle: Text(
                        "Rp ${cartItems[index].price}",
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          String namaBarang =
                              cartItems[index].name;

                          setState(() {
                            cartItems.removeAt(index);
                          });

                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            SnackBar(
                              content: Text(
                                "$namaBarang berhasil dihapus",
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),

            const Divider(),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                "Total Belanja : Rp ${getTotal()}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            if (cartItems.isNotEmpty)
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 12),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.delete_sweep),
                    label: const Text(
                      "Kosongkan Keranjang",
                    ),
                    onPressed: () {
                      setState(() {
                        cartItems.clear();
                      });

                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Keranjang berhasil dikosongkan",
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: cartItems.isEmpty
                      ? null
                      : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ReportPage(
                          cart: cartItems,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Lihat Report",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}