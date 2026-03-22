import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});
  @override
  Widget build(BuildContext context) {
    const Color themeColor = Colors.blueAccent;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 50, 20, 20),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: themeColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Village Marketplace", 
                          style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold)),
                        Text("Shop local products", 
                          style: TextStyle(color: Colors.white70, fontSize: 18)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search products....",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  const Icon(Icons.tune),
                  const SizedBox(width: 15),
                  _buildCategoryChip("All", isSelected: true),
                  _buildCategoryChip("Seeds"),
                  _buildCategoryChip("Spices"),
                  _buildCategoryChip("Vegetables"),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildProductCard("Turmeric powder", "Rs 200", "rate: 5", Icons.photo),
                const SizedBox(height: 20),
                _buildProductCard("Coconut oil", "Rs 100", "rate: 4", Icons.opacity),
                const SizedBox(height: 20),
                _buildProductCard("Fresh seeds", "Rs 50", "rate: 4", Icons.photo),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildCategoryChip(String label, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey[800] : Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
    );
  }
  Widget _buildProductCard(String name, String price, String rate, IconData placeholderIcon) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: double.infinity,
            color: Colors.grey[400],
            child: Icon(placeholderIcon, size: 80, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(price, style: const TextStyle(fontSize: 18, color: Colors.green, fontWeight: FontWeight.w600)),
                if (rate.isNotEmpty) Text(rate, style: const TextStyle(color: Colors.black54)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}