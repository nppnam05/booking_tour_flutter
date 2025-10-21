import 'package:booking_tour_flutter/app/app_navigator.dart';
import 'package:booking_tour_flutter/app/route_manager.dart';
import 'package:booking_tour_flutter/presentation/home/cubit/home_cubit.dart';
import 'package:booking_tour_flutter/presentation/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final _cubit = HomeCubit()..syncPost();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        appBar: AppBar(title: Text("home")),
        body: BlocBuilder<HomeCubit, HomeState>(
          bloc: _cubit,
          builder:
              (context, state) => CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(RouteName.profile);
                      },
                      child: Text("profile"),
                    ),
                  ),
                  SliverList.builder(
                    itemCount: state.activities.length,
                    itemBuilder: (context, index) {
                      final activity = state.activities[index];
                      return Row(
                        children: [
                          Text(activity.id.toString()),
                          SizedBox(width: 10),
                          Text(activity.action),
                        ],
                      );
                    },
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
