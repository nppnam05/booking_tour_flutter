import 'package:booking_tour_flutter/presentation/auth/auth_otp/auth_otp_screen.dart';
import 'package:booking_tour_flutter/presentation/auth/change_password/change_password_screen.dart';
import 'package:booking_tour_flutter/presentation/auth/forget_password/forget_password_screen.dart';
import 'package:booking_tour_flutter/presentation/auth/register/register_screen.dart';
import 'package:booking_tour_flutter/presentation/home/home_screen.dart';
import 'package:booking_tour_flutter/presentation/auth/login/login_screen.dart';
import 'package:booking_tour_flutter/presentation/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class RouteName {
  RouteName._();

  static final home = "home";
  static final profile = "profile";
  static final login = "login";
  static final register = "register";
  static final forgetPassword = "forget_password";
  static final authOtp = "auth_otp";
  static final changePassword = "change_password";
}

class RouteManager {
  RouteManager._();

  static final routes = <String, WidgetBuilder>{
    RouteName.home: (context) => HomeScreen(),
    RouteName.profile: (context) => ProfileScreen(),
    RouteName.login: (context) => LoginScreen(),
    RouteName.register: (context) => RegisterScreen(),
    RouteName.forgetPassword: (context) => ForgetPasswordScreen(),
    RouteName.authOtp: (context) => AuthOtpScreen(),
    RouteName.changePassword: (context) => ChangePasswordScreen(),
  };
}
