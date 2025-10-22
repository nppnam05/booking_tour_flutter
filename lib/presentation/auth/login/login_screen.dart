import 'package:booking_tour_flutter/app/app_navigator.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/app/route_manager.dart';
import 'package:booking_tour_flutter/presentation/auth/login/cubit/login_cubit.dart';
import 'package:booking_tour_flutter/presentation/auth/name_of_screen.dart';
import 'package:booking_tour_flutter/presentation/widgets/custom_button.dart';
import 'package:booking_tour_flutter/presentation/widgets/not_toggle_input_field.dart';
import 'package:booking_tour_flutter/presentation/widgets/not_toggle_input_field_ic.dart';
import 'package:booking_tour_flutter/presentation/widgets/toggle_Input_field.dart';
import 'package:booking_tour_flutter/presentation/widgets/wrapped_outside.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final _cubit = LoginCubit()..syncPost();

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(child: wrappedOutside(context, columnOfWidget())),
        ),
      ),
    );
  }

  // gom các widget lại
  Widget columnOfWidget() {
    final context = AppNavigator.currentContext;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            NameOfScreen.login,
            style: TextStyle(
              fontSize: AppFonts.fontSize32,
              fontFamily: AppFonts.fontFamily,
              fontWeight: AppFonts.fontWeight500,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 50),

          Column(
            children: [
              notToggleInputField(
                _controllerEmail,
                "Email",
                Colors.grey.shade100,
              ),
              const SizedBox(height: 12),
              ToggleInputField(
                controller: _controllerPassword,
                title: "Mật khẩu",
                color: Colors.grey.shade100,
              ),
            ],
          ),

          const SizedBox(height: 20),

          customButton(
            // qua màn Home
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteName.home,
                (route) => false, // Xóa tất cả các route cũ
              );
            },
            text: "Đăng nhập",
          ),

          const SizedBox(height: 20),

          Column(
            children: [
              iconLogin(),
              const SizedBox(height: 12),
              textDangKiQuenMatKhau(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget textDangKiQuenMatKhau(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Chưa có tài khoản? ",
              style: TextStyle(fontWeight: AppFonts.fontWeight700),
            ),
            InkWell(
              // qua màn Đăng ký
              onTap: () {
                Navigator.pushNamed(context, RouteName.register);
              },
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  "Đăng ký ngay",
                  style: TextStyle(
                    color: Color(0xFF0822AB),
                    fontWeight: AppFonts.fontWeight700,
                  ),
                ),
              ),
            ),
          ],
        ),

        InkWell(
          // qua màn quên mật khẩu
          onTap: () {
            Navigator.pushNamed(context, RouteName.forgetPassword);
          },
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(
              "Quên mật khẩu",
              style: TextStyle(
                color: Color(0xFF0822AB),
                fontWeight: AppFonts.fontWeight700,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget iconLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            print("Login fb");
          },
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Image.asset(
              'assets/images/logo_gg.png',
              width: 40,
              height: 40,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            print("Login gg");
          },
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Image.asset(
              'assets/images/logo_fb.png',
              width: 40,
              height: 40,
            ),
          ),
        ),
      ],
    );
  }
}
