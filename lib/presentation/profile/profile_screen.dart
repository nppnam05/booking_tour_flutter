import 'package:booking_tour_flutter/app/app_navigator.dart';
import 'package:booking_tour_flutter/app/route_manager.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("profile")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(
              AppNavigator.navigatorKey.currentContext!,
              RouteName.profile,
            );
          },
          child: Text("profile"),
        ),
      ),
    );
  }
}
