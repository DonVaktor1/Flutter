import 'package:flutter/material.dart';

//import 'package:flutter_application/screens/login_screen.dart'; 
//import 'package:flutter_application/screens/home_screen.dart'; 
//import 'package:flutter_application/screens/book_parcel_screen.dart'; 
//import 'package:flutter_application/screens/track_parcel_screen.dart'; 
import 'package:flutter_application/screens/shop_screen.dart'; 
//import 'package:flutter_application/screens/history_screen.dart'; 

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, 
    //home: LoginScreen()
    //home: HomeScreen()
    //home: BookParcelScreen(),
    //home: TrackParcelScreen(),
    home: ShopScreen()
    //home: HistoryScreen(), // Вказуємо нашу сторінку як стартову
  ));
}