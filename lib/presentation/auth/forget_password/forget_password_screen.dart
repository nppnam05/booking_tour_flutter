import 'package:booking_tour_flutter/app/app_navigator.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/app/route_manager.dart';
import 'package:booking_tour_flutter/presentation/auth/forget_password/cubit/forget_cubit.dart';
import 'package:booking_tour_flutter/presentation/auth/name_of_screen.dart';
import 'package:booking_tour_flutter/presentation/widgets/custom_button.dart';
import 'package:booking_tour_flutter/presentation/widgets/not_toggle_input_field_ic.dart';
import 'package:booking_tour_flutter/presentation/widgets/wrapped_outside.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final _cubit = ForgetCubit()..syncPost();

  final TextEditingController _controllerEmail = TextEditingController();

  ForgetPasswordScreen({super.key});

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Text(
            NameOfScreen.forgetPassword,
            style: TextStyle(
              fontSize: AppFonts.fontSize32,
              fontFamily: AppFonts.fontFamily,
              fontWeight: AppFonts.fontWeight500,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 50),

          notToggleInputFieldNotIcon(
            controller: _controllerEmail,
            title: "Email",
           color:  Colors.grey.shade100,
            validator: (value) {
              
            },
          ),

          const SizedBox(height: 30),

          customButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteName.authOtp);
            },
            text: "Tiếp tục",
          ),
        ],
      ),
    );
  }
}
