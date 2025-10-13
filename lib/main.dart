import 'package:booking_tour_flutter/app.dart';
import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

void main() async {
  //set
  WidgetsFlutterBinding.ensureInitialized();
  configureInjectable();

  runApp(const MyApp());
}

void configureFirebase() {
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Dữ liệu test xem có kết nối database chưa
  //   await FirebaseFirestore.instance.collection("users").add({
  //   "name": "JonDang",
  //   "email": "JonDang@example.com",
  //   "phone": "+84987654321",
  //   "urlAvatar": "https://example.com/avatar_jon.png",
  //   "address": {
  //     "street": "456 Le Loi",
  //     "city": "Da Nang",
  //     "country": "Việt Nam",
  //   },
  //   "createdAt": DateTime.now().toIso8601String(),
  //   "stats": {
  //     "completedTours": 3,
  //     "favoriteCount": 5,
  //     "totalBookings": 4,
  //     "totalSpent": 1599.50,
  //   }
  // });
}
