import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() =>
      _AddProductPageState();
}

class _AddProductPageState
    extends State<AddProductPage> {

  final formKey = GlobalKey<FormState>();

  final nameController =
  TextEditingController();

  final priceController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tambah Barang",
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding:
          const EdgeInsets.all(20),

          child: Form(
            key: formKey,

            child: Column(
              children: [

                TextFormField(
                  controller: nameController,

                  decoration:
                  const InputDecoration(
                    labelText:
                    "Nama Barang",
                  ),

                  validator: (value) {

                    if (value == null ||
                        value.isEmpty) {
                      return "Wajib diisi";
                    }

                    if (value.length < 3) {
                      return "Minimal 3 karakter";
                    }

                    return null;
                  },
                ),

                TextFormField(
                  controller:
                  priceController,

                  keyboardType:
                  TextInputType.number,

                  decoration:
                  const InputDecoration(
                    labelText: "Harga",
                  ),

                  validator: (value) {

                    if (double.tryParse(
                        value ?? "") ==
                        null) {
                      return "Harus angka";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {

                    if (formKey.currentState!
                        .validate()) {

                      ScaffoldMessenger.of(
                          context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Data Valid",
                          ),
                        ),
                      );
                    }
                  },
                  child:
                  const Text("Simpan"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}