import 'package:booking_tour_flutter/presentation/auth/change_password/cubit/change_password_cubit.dart';
import 'package:booking_tour_flutter/presentation/auth/change_password/cubit/change_password_sate.dart';
import 'package:booking_tour_flutter/presentation/auth/name_of_screen.dart';
import 'package:booking_tour_flutter/presentation/widgets/toggle_Input_field.dart';
import 'package:booking_tour_flutter/presentation/widgets/wrapped_outside.dart';
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
        body: BlocBuilder<ChangePasswordCubit, ChangePasswordSate>(
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
          NameOfScreen.changePassword,
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 50),

        Column(
          children: [
            ToggleInputField(
              controller: _controllerFirstPassword,
              text: "Mật khẩu mới",
              color: Colors.grey.shade100,
            ),
            const SizedBox(height: 12),
            ToggleInputField(
              controller: _controllerPassword,
              text: "Mật khẩu",
              color: Colors.grey.shade100,
            ),
          ],
        ),

        const SizedBox(height: 50),
      ],
    );
  }
}
