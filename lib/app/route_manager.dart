import 'package:booking_tour_flutter/presentation/home/home_screen.dart';
import 'package:booking_tour_flutter/presentation/profile/profile_screen.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/add_dia_diem_hoat_dong/them_dia_diem_hoat_dong_screen.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/danh_sach_hoat_dong_screen.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/hoat_dong/hoat_dong_screen.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/quanlychuyendi/tour_manager_screen.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/sua_dia_diem_hoat_dong/sua_dia_diem_hoat_dong_screen.dart';
import 'package:booking_tour_flutter/presentation/widget/drawer_bar.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/test_button_choose_img_screen.dart';
import 'package:flutter/material.dart';

class RouteName {
  RouteName._();

  static final home = "home";
  static final profile = "profile";
  static final menu = "menu";
  static final tour_manager = "tour_manager";
  static final test = "test";
  static final danhSachHoatDong = "danh_sach_hoat_dong";
  static final themDiaDiemHoatDong = "them_dia_diem_hoat_dong";
  static final suaDiaDiemHoatDong = "sua_dia_diem_hoat_dong";
  static final hoatDong = "hoat_dong";
}

class RouteManager {
  RouteManager._();

  static final routes = <String, WidgetBuilder>{
    RouteName.home: (context) => HomeScreen(),
    RouteName.profile: (context) => ProfileScreen(),
    RouteName.menu: (context) => DrawerBar(),
    RouteName.tour_manager: (context) => TourManagerScreen(),
    RouteName.test: (context) => TestScreen(),
    RouteName.danhSachHoatDong: (context) => DanhSachHoatDongScreen(),
    RouteName.themDiaDiemHoatDong: (context) => ThemDiaDiemHoatDongScreen(),
    RouteName.suaDiaDiemHoatDong: (context) => SuaDiaDiemHoatDongScreen(),
    RouteName.hoatDong: (context) => HoatDongScreen(),
  };
}
