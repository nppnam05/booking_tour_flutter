import 'package:booking_tour_flutter/app/app_navigator.dart';
import 'package:booking_tour_flutter/app/booking_dialog.dart';
import 'package:booking_tour_flutter/app/dialog_helper.dart';
import 'package:booking_tour_flutter/app/route_manager.dart';
import 'package:booking_tour_flutter/presentation/auth/auth_cubit.dart';
import 'package:booking_tour_flutter/presentation/home/cubit/home_cubit.dart';
import 'package:booking_tour_flutter/presentation/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final _cubit = HomeCubit()..syncPost();
  

  HomeScreen({super.key});

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
                        int userId = context.read<AuthCubit>().userId;

                        print(userId);
                      },
                      child: Text("profile"),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ElevatedButton(
                      onPressed: () {
                        BookingDialog.selectMultiProvince();
                      },
                      child: Text("select provinces"),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ElevatedButton(
                      onPressed: () {
                        BookingDialog.selectSingleActivity(
                          locationActivityId: 1,
                        );
                      },
                      child: Text("select activity"),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ElevatedButton(
                      onPressed: () {
                        BookingDialog.selectSinglePlace(provinceIds: [1, 2]);
                      },
                      child: Text("select place"),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ElevatedButton(
                      onPressed: () {
                        BookingDialog.selectSingleLocationActivity(placeId: 1);
                      },
                      child: Text("select location activity"),
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
