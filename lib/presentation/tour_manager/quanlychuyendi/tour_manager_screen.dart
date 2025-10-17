import 'package:booking_tour_flutter/presentation/widget/drawer_bar.dart';
import 'package:flutter/material.dart';

class  TourManagerScreen extends StatelessWidget{
  const TourManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quản lý chuyến đi", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: const Color(0xFF23A892),
      ),
      drawer: const DrawerBar(),
      body: Text("aa"),
    );
  }
}