import '../models/product.dart';

class ProductService {
  Future<List<Product>> loadProducts() async {
    await Future.delayed(const Duration(seconds: 2));

    return [
      Product(
        name: "Indomie",
        price: 3500,
        image: "assets/Indomie.jpg",
      ),
      Product(
        name: "Susu UHT",
        price: 8000,
        image: "assets/susu.jpg",
      ),
      Product(
        name: "Roti",
        price: 12000,
        image: "assets/roti.jpg",
      ),
      Product(
        name: "Kopi",
        price: 15000,
        image: "assets/kopi.jpg",
      ),
    ];
  }
}