import 'package:booking_tour_flutter/presentation/home/home_screen.dart';
import 'package:booking_tour_flutter/presentation/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class RouteName {
  RouteName._();

  static final home = "home";
  static final profile = "profile";
}

class RouteManager {
  RouteManager._();

  static final routes = <String, WidgetBuilder>{
    RouteName.home: (context) => HomeScreen(),
    RouteName.profile: (context) => ProfileScreen(),
  };
}
