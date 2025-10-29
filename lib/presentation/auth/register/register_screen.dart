import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/presentation/auth/name_of_screen.dart';
import 'package:booking_tour_flutter/presentation/auth/register/cubit/register_cubit.dart';
import 'package:booking_tour_flutter/presentation/widgets/custom_button.dart';
import 'package:booking_tour_flutter/presentation/widgets/not_toggle_input_field_ic.dart';
import 'package:booking_tour_flutter/presentation/widgets/toggle_Input_field.dart';
import 'package:booking_tour_flutter/presentation/widgets/wrapped_outside.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  final _cubit = RegisterCubit()..syncPost();

  final TextEditingController controllerTenNguoiDung = TextEditingController();
  final TextEditingController controllerSoDienThoai = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerNhapLai = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        appBar: AppBar(backgroundColor: AppColors.scaffoldBackgroundColor),
        body: SingleChildScrollView(
          child: Center(child: wrappedOutside(context, columnOfWidget())),
        ),
      ),
    );
  }

  // gom các widget lại
  Widget columnOfWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            NameOfScreen.register,
            style: TextStyle(
              fontSize: AppFonts.fontSize32,
              fontFamily: AppFonts.fontFamily,
              fontWeight: AppFonts.fontWeight500,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 30),

          Column(
            children: [
              notToggleInputFieldNotIcon(
                controllerTenNguoiDung,
                "Tên người dùng",
                Colors.grey.shade100,
              ),
              const SizedBox(height: 12),

              notToggleInputFieldNotIcon(
                controllerSoDienThoai,
                "Số điện thoại",
                Colors.grey.shade100,
              ),
              const SizedBox(height: 12),

              notToggleInputFieldNotIcon(
                controllerEmail,
                "Email",
                Colors.grey.shade100,
              ),
              const SizedBox(height: 12),

              ToggleInputField(
                controller: controllerPassword,
                title: "Mật khẩu",
                color: Colors.grey.shade100,
              ),
              const SizedBox(height: 12),

              ToggleInputField(
                controller: controllerNhapLai,
                title: "Nhập lại mật khẩu",
                color: Colors.grey.shade100,
              ),
              const SizedBox(height: 12),
            ],
          ),

          const SizedBox(height: 10),

          customButton(
            onPressed: () {
              print("Đăng nhập EEEEEEEEEEEEEEEEE");
            },
            text: "Tiếp theo",
          ),

          const SizedBox(height: 20),

          Column(children: [textDangNhap()]),
        ],
      ),
    );
  }

  Widget textDangNhap() {
    return Column(
      children: [
        Text("Đã có tài khoản? "),
        GestureDetector(
          onTap: () {
            print("Đăng nhập ngay");
          },
          child: const Padding(
            // Nên dùng Padding để tạo khoảng đệm cho vùng click
            padding: EdgeInsets.all(4.0),
            child: Text(
              "Đăng nhập ngay",
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
