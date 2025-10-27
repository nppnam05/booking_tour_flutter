import 'package:booking_tour_flutter/app/app_navigator.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/app/route_manager.dart';
import 'package:booking_tour_flutter/presentation/auth/change_password/cubit/change_password_cubit.dart';
import 'package:booking_tour_flutter/presentation/auth/name_of_screen.dart';
import 'package:booking_tour_flutter/presentation/widgets/toggle_Input_field.dart';
import 'package:booking_tour_flutter/presentation/widgets/wrapped_outside.dart';
import 'package:booking_tour_flutter/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordScreen extends StatelessWidget {
  final _cubit = ChangePasswordCubit()..syncPost();

  final TextEditingController _controllerFirstPassword =
      TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

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
    final context = AppNavigator.currentContext;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            NameOfScreen.changePassword,
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
              ToggleInputField(
                controller: _controllerFirstPassword,
                title: "Mật khẩu mới",
                color: Colors.grey.shade100,
              ),
              const SizedBox(height: 12),
              ToggleInputField(
                controller: _controllerPassword,
                title: "Mật khẩu",
                color: Colors.grey.shade100,
              ),
            ],
          ),

          const SizedBox(height: 50),

          customButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteName.login);
            },
            text: "Xác nhận",
          ),
        ],
      ),
    );
  }
}
