import 'package:booking_tour_flutter/presentation/tour_manager/add_tour/cubit/add_tour_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppGlobalProvider extends StatelessWidget{
  final Widget child;

  const AppGlobalProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => AddTourCubit())
    ], child: child);
  }

}