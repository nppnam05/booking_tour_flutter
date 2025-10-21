import 'package:booking_tour_flutter/presentation/auth/login/cubit/login_cubit.dart';
import 'package:booking_tour_flutter/presentation/auth/login/cubit/login_state.dart';
import 'package:booking_tour_flutter/presentation/auth/name_of_screen.dart';
import 'package:booking_tour_flutter/presentation/widgets/not_toggle_input_field.dart';
import 'package:booking_tour_flutter/presentation/widgets/toggle_Input_field.dart';
import 'package:booking_tour_flutter/presentation/widgets/wrapped_outside.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  final _cubit = LoginCubit()..syncPost();

  final TextEditingController controllerTenNguoiDung = TextEditingController();
  final TextEditingController controllerSoDienThoai = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerNhapLai = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        appBar: AppBar(title: Text(NameOfScreen.register),),
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
          NameOfScreen.register,
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 50),

        Column(
          children: [
            notToggleInputField(controllerTenNguoiDung, "Tên người dùng", Colors.grey.shade100),
            const SizedBox(height: 12),

            notToggleInputField(controllerSoDienThoai, "Số điện thoại", Colors.grey.shade100),
            const SizedBox(height: 12),

            notToggleInputField(controllerEmail, "Email", Colors.grey.shade100),
            const SizedBox(height: 12),

            
            
            ToggleInputField(controller: controllerPassword, text: "Mật khẩu", color: Colors.grey.shade100),
            const SizedBox(height: 12),

             ToggleInputField(controller: controllerNhapLai, text: "Nhập lại mật khẩu", color: Colors.grey.shade100),
            const SizedBox(height: 12),
          ],
        ),

        const SizedBox(height: 50),

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
                print("Dang ky ngay");
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
}
