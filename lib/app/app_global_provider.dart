import 'package:booking_tour_flutter/presentation/auth/auth_cubit.dart';
import 'package:booking_tour_flutter/presentation/auth/auth_otp/cubit/auth_otp_cubit.dart';
import 'package:booking_tour_flutter/presentation/auth/auth_otp_change_password/cubit/auth_otp_change_password_cubit.dart';
import 'package:booking_tour_flutter/presentation/auth/change_password/cubit/change_password_cubit.dart';
import 'package:booking_tour_flutter/presentation/profile/change_schedule/cubit/change_schedule_cubit.dart';
import 'package:booking_tour_flutter/presentation/auth/login/cubit/login_cubit.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/assignment/schedule_assignment/cubit/schedule_assignment_cubit.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/assignment/tour_guide_assignment/cubit/tour_guide_assignment_cubit.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/add_tour/cubit/add_tour_cubit.dart';
import 'package:booking_tour_flutter/presentation/user/book_a_schedule/cubit/book_schedule_cubit.dart';
import 'package:booking_tour_flutter/presentation/user/pay/cubit/pay_schedule_cubit.dart';
import 'package:booking_tour_flutter/presentation/user/schedule_detail/cubit/schedule_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppGlobalProvider extends StatelessWidget {
  final Widget child;

  const AppGlobalProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider(create: (_) => AuthOtpChangePasswordCubit()),
      BlocProvider(create: (_) => ChangePasswordCubit()),
      BlocProvider(create: (_) => AuthOtpCubit()),
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => AddTourCubit()),
        BlocProvider(create: (_) => TourGuideAssignmentCubit()),
        BlocProvider(create: (_) => ScheduleAssignmentCubit()),
        BlocProvider(create: (_) => ChangeScheduleCubit()),
        BlocProvider(create: (_) => PayScheduleCubit()),
        BlocProvider(create: (_) => ScheduleDetailCubit()),
        BlocProvider(create: (_) => BookScheduleCubit()),
      ], 
   
      child: child,
    );
  }
}
