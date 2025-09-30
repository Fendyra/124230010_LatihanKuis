import 'package:flutter/material.dart';
import 'package:latihan_kuis/models/food_menu_model.dart';

class DetailPage extends StatelessWidget {
  final FoodMenu food;

  const DetailPage({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    bool isNetworkImage = food.imageUrl.startsWith('http');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Details'),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 199, 0, 0),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Gambar utama
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Hero(
              tag: food.imageUrl, // Tag Hero harus unik
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                child: isNetworkImage
                    ? Image.network(
                        food.imageUrl,
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        food.imageUrl,
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),

          // Konten Detail
          Positioned(
            top: MediaQuery.of(context).size.height * 0.45,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(24.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nama Makanan dan Harga
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            food.name,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          food.price,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 199, 0, 0),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Tags
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: food.tags
                          .map((tag) => Chip(
                                label: Text(tag),
                                backgroundColor: Colors.red.withOpacity(0.1),
                                labelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 199, 0, 0)),
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 24),

                    // About
                    const Text(
                      'About',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      food.about,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // Tombol "Add to Cart"
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 199, 0, 0),
            padding: const EdgeInsets.symmetric(vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {
            // Logika untuk menambahkan ke keranjang
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${food.name} added to cart! 🔥'),
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 2),
              ),
            );
          },
          child: const Text(
            'Add to Cart 🛒',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}