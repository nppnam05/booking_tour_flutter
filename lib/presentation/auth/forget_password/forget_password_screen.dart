import 'package:booking_tour_flutter/presentation/auth/forget_password/cubit/forget_cubit.dart';
import 'package:booking_tour_flutter/presentation/auth/forget_password/cubit/forget_state.dart';
import 'package:booking_tour_flutter/presentation/auth/name_of_screen.dart';
import 'package:booking_tour_flutter/presentation/widgets/not_toggle_input_field.dart';
import 'package:booking_tour_flutter/presentation/widgets/wrapped_outside.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordScreen extends StatelessWidget {
  
  final _cubit = ForgetCubit()..syncPost();

  final TextEditingController _controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        appBar: AppBar(title: Text(NameOfScreen.forgetPassword),),
        body: BlocBuilder<ForgetCubit, ForgetState>(
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 50),
        Text(
          NameOfScreen.forgetPassword,
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 50),

        notToggleInputField(_controllerEmail, "Email", Colors.grey.shade100),
      ],
    );
  }

}
