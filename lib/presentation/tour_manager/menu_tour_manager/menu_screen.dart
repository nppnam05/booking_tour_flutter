import 'package:booking_tour_flutter/presentation/tour_manager/quanlychuyendi/tour_manager_screen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('BooKing Tour', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
        backgroundColor: const Color(0xFF23A892),
      ),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
        children: <Widget> [
          // Menu chuyển màn hình Tour Manager
          ListTile(onTap: () => { Navigator.push(context, MaterialPageRoute(builder: (context) => TourManagerScreen())) }, leading: Icon(Icons.route),title: Text("Chuyến đi"),),
          ListTile(onTap: () => { print("haha")}, leading: Icon(Icons.calendar_today),title: Text("Lịch trình"),),
          ListTile(onTap: () => { print("hehe")}, leading: Icon(Icons.person_pin_circle),title: Text("Phân công"),),
          ListTile(onTap: () => { print("Hello")}, leading: Icon(Icons.place_outlined),title: Text("Địa danh"),),
          ListTile(onTap: () => { print("Hello")}, leading: Icon(Icons.group),title: Text("Hoạt động"),),
          ListTile(onTap: () => { print("Hello")}, leading: Icon(Icons.local_taxi),title: Text("Địa điểm hoạt động"),),
        ],
      ),
      ) 
    );
  }
}