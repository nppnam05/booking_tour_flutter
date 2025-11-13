import 'package:booking_tour_flutter/domain/schedule_tourguide.dart';
import 'package:booking_tour_flutter/presentation/auth/auth_otp/auth_otp_screen.dart';
import 'package:booking_tour_flutter/presentation/auth/auth_otp_change_password/auth_otp_change_password_screen.dart';
import 'package:booking_tour_flutter/presentation/auth/change_password/change_password_screen.dart';
import 'package:booking_tour_flutter/presentation/auth/forget_password/forget_password_screen.dart';
import 'package:booking_tour_flutter/presentation/auth/register/register_screen.dart';
import 'package:booking_tour_flutter/presentation/home/home_screen.dart';
import 'package:booking_tour_flutter/presentation/auth/login/login_screen.dart';
import 'package:booking_tour_flutter/presentation/profile/change_schedule/change_schedule_screen.dart';
import 'package:booking_tour_flutter/presentation/profile/detail_paid_schedule/detail_paid_schedule_screen.dart';
import 'package:booking_tour_flutter/presentation/profile/profile_screen.dart';
import 'package:booking_tour_flutter/presentation/profile/review_schedule/review_schedule_screen.dart';
import 'package:booking_tour_flutter/presentation/tour_guide/participants_screen.dart';
import 'package:booking_tour_flutter/presentation/tour_guide/schedule_tourguide_screen.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/lich_trinh/danh_sach_lich_trinh/schedule_tourmanager_screen.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/add_tour/real_add_tour_screen.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/add_tour/update_tour_screen.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/assignment/assignment_screen.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/danh_sach_dia_diem_hoat_dong_screen.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/dia_danh/danh_sach_dia_danh/danh_sach_dia_danh.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/dia_danh/sua_dia_danh/sua_dia_danh.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/dia_danh/them_dia_danh/them_dia_danh.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/sua_dia_diem_hoat_dong_screen.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/danh_sach_hoat_dong/them_dia_diem_hoat_dong_screen.dart';

import 'package:booking_tour_flutter/presentation/tour_manager/hoat_dong/hoat_dong_screen.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/lich_trinh/chi_tiet_lich_trinh/chi_tiet_lich_trinh.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/lich_trinh/them_lich_trinh/them_lich_trinh.dart';
import 'package:booking_tour_flutter/presentation/trip/trip_screen.dart';
import 'package:booking_tour_flutter/presentation/user/book_a_schedule/book_schedule_screen.dart';
import 'package:booking_tour_flutter/presentation/user/pay/pay_schedule_screen.dart';
import 'package:booking_tour_flutter/presentation/user/schedule_detail/schedule_detail_screen.dart';
import 'package:booking_tour_flutter/presentation/user/danh_sach_lich_trinh_booking/danh_sach_lich_trinh_booking_screen.dart';
import 'package:booking_tour_flutter/presentation/user/favorite/favorite_tour_screen.dart';
import 'package:booking_tour_flutter/presentation/user/profile/profileUser_screen.dart';
import 'package:booking_tour_flutter/presentation/user/search/search_screen.dart';
import 'package:booking_tour_flutter/presentation/user/lich_trinh_da_hoan_thanh/lich_trinh_da_hoan_thanh_screen.dart';
import 'package:booking_tour_flutter/presentation/user/thong_tin_cua_ban/thong_tin_cua_ban_screen.dart';
import 'package:booking_tour_flutter/presentation/user/update_password/update_password_screen.dart';
import 'package:booking_tour_flutter/presentation/user/vi/vi_screen.dart';
import 'package:booking_tour_flutter/presentation/user/chi_tiet_lich_trinh.dart/chi_tiet_lich_trinh_screen.dart';
import 'package:booking_tour_flutter/presentation/user/danh_sach_chuyen_di/danh_sach_chuyen_di_screen.dart';
import 'package:booking_tour_flutter/presentation/user/danh_sach_lich_trinh/danh_sach_lich_trinh_user.dart';
import 'package:booking_tour_flutter/presentation/user/thong_bao/thong_bao_screen.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/drawer_bar/drawer_bar.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/test_button_choose_img_screen.dart';
import 'package:flutter/material.dart';

class RouteName {
  RouteName._();

  static final home = "home";
  static final profile = "profile";
  static final profileDetailPaidSchedule = "profile_detail_paid_schedule";
  static final profileChangeSchedule = "profile_change_schedule";
  static final profileReviewSchedule = "profile_review_schedule";
  static final scheduleDetail = "schedule_detail";

  static final menu = "menu";
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
  static final assignment = "assignment";

  static final addTour = "addTour";
  static final updateTour = "updateTour";
  static final tripList = "tripList";
  static final scheduleTourguide = "scheduleTourguide";
  static final ScheduleTourmanager = "scheduleTourmanager";
  static final participants = "participants";

  static final danhSachDiaDanh = "danh_sach_dia_danh";
  static final themDiaDanh = "them_dia_danh";
  static final suaDiaDanh = "sua_dia_danh";
  static final scheduleTourmanager = "scheduleTourmanager";
  static final searchTour = "searchTour";

  static final thongTinCuaBan = "thongTinCuaBan";
  static final vi = "vi";
  static final lichTrinhDaHoanThanh = "lichTrinhDaHoanThanh";
  static final danhSachLichTrinhBooking = "danhSachLichTrinhBooking";
  static final favoriteTour = "favoriteTour";
  static final profileScreen = "profileScreen";
  static final danhSachChuyenDi = "danh_sach_chuyen_di";
  static final thongBao = "thong_bao";
  static final danhSachLichTrinhUser = "danh_sach_lich_trinh_user";
  static final chiTietLichTrinhScreen = "chi_tiet_lich_trinh_screen";
  static final bookSchedule = "book_schedule";
  static final paySchedule = "pay_schedule";
  static final update_password_user = "update_password_user";
}

class RouteManager {
  RouteManager._();

  static final routes = <String, WidgetBuilder>{
    RouteName.home: (context) => HomeScreen(),
    RouteName.profile: (context) => ProfileScreen(),
    RouteName.menu: (context) => DrawerBar(),
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
    RouteName.danhSachDiaDanh: (context) => DanhSachDiaDanhScreen(),
    RouteName.themDiaDanh: (context) => ThemDiaDanhScreen(),
    RouteName.suaDiaDanh: (context) => SuaDiaDanhScreen(),
    RouteName.addTour: (context) => RealAddTourScreen(),
    RouteName.tripList: (context) => TripScreen(),
    RouteName.assignment: (context) => AssignmentScreen(),
    RouteName.updateTour: (context) => UpdateTourScreen(),
    RouteName.scheduleTourguide: (context) => ScheduleTourguideScreen(),
    RouteName.ScheduleTourmanager: (context) => ScheduleTourmanagerScreen(),

    RouteName.thongTinCuaBan: (context) => ThongTinCuaBanScreen(),
    RouteName.vi: (context) => ViScreen(),
    RouteName.lichTrinhDaHoanThanh: (context) => LichTrinhDaHoanThanhScreen(),
    RouteName.danhSachLichTrinhBooking:
        (context) => DanhSachLichTrinhBookingScreen(),

    RouteName.participants: (context) {
      final schedule =
          ModalRoute.of(context)?.settings.arguments as ScheduleTourguide;
      return ParticipantsScreen(schedule: schedule);
    },
    RouteName.searchTour: (context) => SearchScreen(),
    RouteName.searchTour: (context) => SearchScreen(),
    RouteName.danhSachChuyenDi: (context) => DanhSachChuyenDiScreen(),
    RouteName.thongBao: (context) => ThongBaoScreen(),
    RouteName.danhSachLichTrinhUser: (context) => DanhSachLichTrinhUser(),
    RouteName.profileDetailPaidSchedule:
        (context) => DetailPaidScheduleScreen(),
    RouteName.profileChangeSchedule: (context) => const ChangeScheduleScreen(),
    RouteName.profileReviewSchedule: (context) => ReviewScheduleScreen(),
    RouteName.chiTietLichTrinhScreen: (context) => ChiTietLichTrinhScreen(),
    RouteName.favoriteTour: (context) => FavoriteTourScreen(userId: 2),
    RouteName.profileScreen: (context) => ProfileUserScreen(userId: 1),
    RouteName.scheduleDetail: (context) => ScheduleDetailScreen(),
    RouteName.bookSchedule: (context) => BookScheduleScreen(),
    RouteName.paySchedule: (context) => PayScheduleScreen(),
    RouteName.update_password_user:
        (context) => UpdatePasswordScreen(userId: 2),
  };
}
