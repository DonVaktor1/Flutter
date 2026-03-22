import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color themeColor = Colors.green;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 50, 20, 30),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: themeColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  label: const Text("Back", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Delivery History", 
                        style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text("all your past deliveries", 
                        style: TextStyle(color: Colors.white70, fontSize: 18)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("RD2024001", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                            Text("In Transit", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16)),
                          ],
                        ),
                        const Text("ABCD....", style: TextStyle(fontSize: 16)),
                        const Text("recipients phone number", style: TextStyle(decoration: TextDecoration.underline)),
                        const Text("63.........01"),
                        const Text("Booking Date: 08/02/26", style: TextStyle(fontWeight: FontWeight.bold)),
                        const Divider(height: 30, color: Colors.black54),
                        Row(
                          children: const [
                            Icon(Icons.location_on, size: 20),
                            SizedBox(width: 8),
                            Text("Route", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text("From: Village center,Rampur", style: TextStyle(fontSize: 15)),
                        const Text("To: Post Office,Shahpur", style: TextStyle(fontSize: 15)),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.pinkAccent.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text("Expected By:14/02/26", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Summary", style: TextStyle(color: Colors.green, fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildSummaryStat("1", "Total bookings"),
                      _buildSummaryStat("0", "Delivered"),
                      _buildSummaryStat("1", "In Transit"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryStat(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }
}