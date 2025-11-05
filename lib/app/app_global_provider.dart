import 'package:booking_tour_flutter/presentation/profile/change_schedule/cubit/change_schedule_cubit.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/assignment/schedule_assignment/cubit/schedule_assignment_cubit.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/assignment/tour_guide_assignment/cubit/tour_guide_assignment_cubit.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/add_tour/cubit/add_tour_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppGlobalProvider extends StatelessWidget {
  final Widget child;

  const AppGlobalProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AddTourCubit()),
        BlocProvider(create: (_) => TourGuideAssignmentCubit()),
        BlocProvider(create: (_) => ScheduleAssignmentCubit()),
        BlocProvider(create: (_) => ChangeScheduleCubit()),
      ],
      child: child,
    );
  }
}
