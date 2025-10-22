import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/presentation/auth/auth_otp/cubit/auth_otp_cubit.dart';
import 'package:booking_tour_flutter/presentation/auth/name_of_screen.dart';
import 'package:booking_tour_flutter/presentation/widgets/custom_button.dart';
import 'package:booking_tour_flutter/presentation/widgets/otp_input.dart';
import 'package:booking_tour_flutter/presentation/widgets/wrapped_outside.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthOtpChangePasswordScreen extends StatelessWidget {
  final _cubit = AuthOtpCubit()..syncPost();

  final time = 59;

  final TextEditingController _controllerOTP = TextEditingController();

  // final settings = ModalRoute.of(context)!.settings;

  // final args = settings.arguments as Map<String, dynamic>;
  // final String email = args['email'] as String;
  final String email = "nam@gmail.com";
  final String nameScreem = "Quên mật khẩu";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        appBar: AppBar(backgroundColor: AppColors.scaffoldBackgroundColor),
        body: Center(child: wrappedOutside(context, columnOfWidget())),
      ),
    );
  }

  // gom các widget lại
  Widget columnOfWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Text(
            nameScreem,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 40),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Mã xác thực sẽ được gửi đến", style: AppFonts.text14.copyWith(fontWeight: FontWeight.bold)),
                  Text(
                    nameScreem == NameOfScreen.forgetPassword
                        ? maskEmail(email)
                        : email,
                        style: AppFonts.text14.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Mã OTP", style: AppFonts.text14.copyWith(fontWeight: FontWeight.bold)),
              Text("$time s")
            ],
          ),

          const SizedBox(height: 5,),

          OtpInputWidget(
            controller: _controllerOTP,
            onCompleted: (pin) {
              print('OTP nhập xong: $pin');
            },
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: customButton(
                  onPressed: () {},
                  text: "Gửi lại mã",
                  colorText: AppColors.black,
                  colorButton: const Color(0xFFB9B9B9),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: customButton(onPressed: () {}, text: "Xác nhận"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String maskEmail(String email) {
    int atIndex = email.indexOf('@');

    String firstChar = email.substring(0, 1);
    String domain = email.substring(atIndex);

    int length = email.substring(1, atIndex).length;

    String start = "";
    for (int i = 0; i < length; ++i) {
      start += "*";
    }

    return firstChar + start + domain;
  }
}
