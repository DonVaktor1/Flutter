import 'package:flutter/material.dart';
import 'package:flutter_application/screens/book_parcel_screen.dart'; 
import 'package:flutter_application/screens/track_parcel_screen.dart'; 
import 'package:flutter_application/screens/shop_screen.dart'; 
import 'package:flutter_application/screens/history_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Хедер
            Container(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xFFFF9D42), Color(0xFFFF8000)]),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: Column(children: [
                Row(children: [
                  const CircleAvatar(backgroundColor: Colors.white24, child: Icon(Icons.inventory_2, color: Colors.white)),
                  const SizedBox(width: 12),
                  const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text("GaonExpress", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                    Text("Rural Delivery & Shop", style: TextStyle(color: Colors.white70, fontSize: 16)),
                  ])),
                  const Icon(Icons.person, color: Colors.white, size: 28),
                  const SizedBox(width: 15),
                  const Icon(Icons.logout, color: Colors.white, size: 28),
                ]),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Colors.pinkAccent, Colors.orangeAccent]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(children: const [
                    Icon(Icons.local_shipping, color: Colors.white, size: 35),
                    SizedBox(width: 15),
                    Text("1 Active Deliveries", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  ]),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2.3,
                children: [
                  _buildButton(context, "Book", "Send package", Colors.deepOrangeAccent, Icons.all_inbox, true, const BookParcelScreen()),
                  _buildButton(context, "Track", "Check location", Colors.pinkAccent, Icons.location_on, true, const TrackParcelScreen()),
                  _buildButton(context, "Shop", "Buy local", Colors.blueAccent, Icons.shopping_bag, true, const ShopScreen()),
                  _buildButton(context, "History", "Past orders", Colors.green, Icons.history, true, const HistoryScreen()),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10), // Виправив Padding, щоб текст не був посередині
              child: Text("Service For Farmers", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),

            // Кнопки фермерів (додав context та null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(children: [
                Expanded(child: _buildButton(context, "Sell", "", Colors.green, Icons.storefront, false, null)),
                const SizedBox(width: 8),
                Expanded(child: _buildButton(context, "Crop AI", "", Colors.lightGreen, Icons.psychology, false, null)),
                const SizedBox(width: 8),
                Expanded(child: _buildButton(context, "Health", "", Colors.teal, Icons.medical_services, false, null)),
              ]),
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Text("Connectivity Support", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(children: [
                Expanded(child: _buildButton(context, "Offline", "", Colors.orange, Icons.wifi_off, false, null)),
                const SizedBox(width: 8),
                Expanded(child: _buildButton(context, "Data", "", Colors.blueGrey, Icons.data_usage, false, null)),
                const SizedBox(width: 8),
                Expanded(child: _buildButton(context, "Voice", "", Colors.blue, Icons.mic, false, null)),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 25, 15, 30),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey[300]!)),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: const [Icon(Icons.access_time, size: 20, color: Colors.orange), SizedBox(width: 8), Text("Recent deliveries", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))]),
                  const SizedBox(height: 12),
                  const Text("RD2024001 - ABCD", style: TextStyle(fontWeight: FontWeight.w500)),
                  const Text("Rampur → Post office, Shahpur", style: TextStyle(color: Colors.black54)),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildButton(BuildContext context, String title, String sub, Color color, IconData icon, bool isWide, Widget? targetScreen) {
    return GestureDetector(
      onTap: () {
        if (targetScreen != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => targetScreen),
          );
        }
      },
      child: Container(
        height: isWide ? null : 90,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [BoxShadow(color: color.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))],
        ),
        child: isWide 
          ? Row(children: [
              const SizedBox(width: 12),
              Icon(icon, color: Colors.white, size: 26),
              const SizedBox(width: 10),
              Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                if (sub.isNotEmpty) Text(sub, style: const TextStyle(color: Colors.white70, fontSize: 16)),
              ])
            ])
          : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(icon, color: Colors.white, size: 30),
              const SizedBox(height: 8),
              Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
            ]),
      ),
    );
  }
}