import 'package:booking_tour_flutter/presentation/auth/login/cubit/login_cubit.dart';
import 'package:booking_tour_flutter/presentation/auth/login/cubit/login_state.dart';
import 'package:booking_tour_flutter/presentation/auth/name_of_screen.dart';
import 'package:booking_tour_flutter/presentation/widgets/custom_button.dart';
import 'package:booking_tour_flutter/presentation/widgets/not_toggle_input_field.dart';
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
        body: BlocBuilder<LoginCubit, LoginState>(
          bloc: _cubit,
          builder:
              (context, state) =>
                  Center(child: wrappedOutside(context, columnOfWidget())),
        ),
      ),
    );
  }

  // gom các widget lại
  Widget columnOfWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          NameOfScreen.login,
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
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
              text: "Mật khẩu",
              color: Colors.grey.shade100,
            ),
          ],
        ),

        const SizedBox(height: 20),

        customButton(
          onPressed: () {
            print("Đăng nhập EEEEEEEEEEEEEEEEE");
          },
          text: "Đăng nhập",
        ),

        const SizedBox(height: 20),

        Column(
          children: [
            iconLogin(),
            const SizedBox(height: 12),
            textDangKiQuenMatKhau(),
          ],
        ),
      ],
    );
  }

  Widget textDangKiQuenMatKhau() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Chưa có tài khoản? "),
            GestureDetector(
              onTap: () {
                print(
                  _controllerEmail.text + " asdasd " + _controllerPassword.text,
                );
              },
              child: const Padding(
                // Nên dùng Padding để tạo khoảng đệm cho vùng click
                padding: EdgeInsets.all(4.0),
                child: const Text(
                  "Đăng ký ngay",
                  style: TextStyle(
                    color: Color(0xFF0822AB),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            print("Quên mật khẩu");
          },
          child: const Padding(
            // Nên dùng Padding để tạo khoảng đệm cho vùng click
            padding: EdgeInsets.all(4.0),
            child: const Text(
              "Quên mật khẩu",
              style: TextStyle(
                color: Color(0xFF0822AB),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget iconLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            print("Login fb");
          },
          child: Image.asset(
            'assets/images/logo_fb.png',
            width: 40,
            height: 40,
          ),
        ),
        InkWell(
          onTap: () {
            print("Login gg");
          },
          child: Image.asset(
            'assets/images/logo_gg.png',
            width: 40,
            height: 40,
          ),
        ),
      ],
    );
  }
}
