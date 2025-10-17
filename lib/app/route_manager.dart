import 'package:booking_tour_flutter/presentation/home/home_screen.dart';
import 'package:booking_tour_flutter/presentation/profile/profile_screen.dart';
import 'package:booking_tour_flutter/presentation/widget/drawer_bar.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/quanlychuyendi/tour_manager_screen.dart';
import 'package:flutter/material.dart';

class RouteName {
  RouteName._();

  static final home = "home";
  static final profile = "profile";
  static final menu = "menu";
  static final tour_manager = "tour_manager";
}

class RouteManager {
  RouteManager._();

  static final routes = <String, WidgetBuilder>{
    RouteName.home: (context) => HomeScreen(),
    RouteName.profile: (context) => ProfileScreen(),
    RouteName.menu: (context) => DrawerBar(),
    RouteName.tour_manager: (context) => TourManagerScreen(),
  };
}
