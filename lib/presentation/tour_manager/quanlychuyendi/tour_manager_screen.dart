import 'package:booking_tour_flutter/presentation/tour_manager/menu_tour_manager/menu_screen.dart';
import 'package:flutter/material.dart';

class  TourManagerScreen extends StatelessWidget{
  const TourManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
              onTap: () => { Navigator.push(context, MaterialPageRoute(builder: (context) => MenuScreen()))},
              child: Icon(Icons.menu),
            ),
        title: Text("Quản lý chuyến đi", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: const Color(0xFF23A892),
      ),
      body: Text("aa"),
    );
  }
}