import 'package:booking_tour_flutter/presentation/assignment/tour_guide_assignment/cubit/tour_guide_assignment_cubit.dart';
import 'package:booking_tour_flutter/presentation/assignment/tour_guide_assignment/tour_guide_assignment_screen.dart';
import 'package:booking_tour_flutter/presentation/auth/auth_otp/auth_otp_screen.dart';
import 'package:booking_tour_flutter/presentation/auth/auth_otp_change_password/auth_otp_change_password_screen.dart';
import 'package:booking_tour_flutter/presentation/auth/change_password/change_password_screen.dart';
import 'package:booking_tour_flutter/presentation/auth/forget_password/forget_password_screen.dart';
import 'package:booking_tour_flutter/presentation/auth/register/register_screen.dart';
import 'package:booking_tour_flutter/presentation/home/home_screen.dart';
import 'package:booking_tour_flutter/presentation/auth/login/login_screen.dart';
import 'package:booking_tour_flutter/presentation/profile/profile_screen.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/add_dia_diem_hoat_dong/them_dia_diem_hoat_dong_screen.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/add_tour/add_tour_screen.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/add_tour/real_add_tour_screen.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/add_tour/update_tour_screen.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/assignment/assignment_screen.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/danh_sach_hoat_dong_screen.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/dia_danh/danh_sach_dia_danh/danh_sach_dia_danh.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/dia_danh/sua_dia_danh/sua_dia_danh.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/dia_danh/them_dia_danh/them_dia_danh.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/hoat_dong/hoat_dong_screen.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/lich_trinh/chi_tiet_lich_trinh/chi_tiet_lich_trinh.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/lich_trinh/danh_sach_lich_trinh/danh_sach_lich_trinh.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/lich_trinh/them_lich_trinh/them_lich_trinh.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/sua_dia_diem_hoat_dong/sua_dia_diem_hoat_dong_screen.dart';
import 'package:booking_tour_flutter/presentation/trip/trip_screen.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/datepicker_and_time/date_picker.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/drawer_bar/drawer_bar.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/test_button_choose_img_screen.dart';
import 'package:flutter/material.dart';

class RouteName {
  RouteName._();

  static final home = "home";
  static final profile = "profile";

  static final menu = "menu";
  static final danhSachLichTrinh = "danh_sach_lich_trinh";
  static final themLichTrinh = "them_lich_trinh";
  static final chiTietLichTrinh = "chi_tiet_lich_trinh";
  static final test = "test";
  static final danhSachHoatDong = "danh_sach_hoat_dong";
  static final themDiaDiemHoatDong = "them_dia_diem_hoat_dong";
  static final suaDiaDiemHoatDong = "sua_dia_diem_hoat_dong";
  static final hoatDong = "hoat_dong";
  static final login = "login";
  static final register = "register";
  static final forgetPassword = "forget_password";
  static final authOtp = "auth_otp";
  static final changePassword = "change_password";
  static final authOtpChangePassword = "auth_otp_change_password";
  static final assignment = "assignment";  static final tourGuideAssignment = "tour_guide_assignment";

  static final addTour = "addTour";
  static final updateTour = "updateTour";
  static final tripList = "tripList";
  
  static final danhSachDiaDanh = "danh_sach_dia_danh";
  static final themDiaDanh = "them_dia_danh";
  static final suaDiaDanh = "sua_dia_danh";
  
}

class RouteManager {
  RouteManager._();

  static final routes = <String, WidgetBuilder>{
    RouteName.home: (context) => HomeScreen(),
    RouteName.profile: (context) => ProfileScreen(),
    RouteName.menu: (context) => DrawerBar(),
    RouteName.danhSachLichTrinh: (context) => DanhSachLichTrinhScreen(),
    RouteName.themLichTrinh: (context) => ThemLichTrinhScreen(),
    RouteName.chiTietLichTrinh: (context) => ChiTietTrinhScreen(),
    RouteName.test: (context) => TestScreen(),
    RouteName.danhSachHoatDong: (context) => DanhSachHoatDongScreen(),
    RouteName.themDiaDiemHoatDong: (context) => ThemDiaDiemHoatDongScreen(),
    RouteName.suaDiaDiemHoatDong: (context) => SuaDiaDiemHoatDongScreen(),
    RouteName.hoatDong: (context) => HoatDongScreen(),
    RouteName.login: (context) => LoginScreen(),
    RouteName.register: (context) => RegisterScreen(),
    RouteName.forgetPassword: (context) => ForgetPasswordScreen(),
    RouteName.authOtp: (context) => AuthOtpScreen(),
    RouteName.changePassword: (context) => ChangePasswordScreen(),
    RouteName.authOtpChangePassword: (context) => AuthOtpChangePasswordScreen(),
    RouteName.tourGuideAssignment: (context) => TourGuideAssignmentScreen(),
    RouteName.danhSachDiaDanh: (context) => DanhSachDiaDanhScreen(),
    RouteName.themDiaDanh: (context) => ThemDiaDanhScreen(),
    RouteName.suaDiaDanh: (context) => SuaDiaDanhScreen(),
    RouteName.addTour: (context) => RealAddTourScreen(),
    RouteName.tripList: (context) => TripScreen(),
    RouteName.assignment: (context) => AssignmentScreen(),
    RouteName.updateTour: (context) => UpdateTourScreen(),
  };
}
