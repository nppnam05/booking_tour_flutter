import 'package:booking_tour_flutter/presentation/widgets_dialog/dialog_noti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:get_it/get_it.dart';

import 'cubit/schedule_tourmanager_cubit.dart';
import 'cubit/schedule_tourmanager_state.dart';
import 'schedule_tourmanager_card.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/drawer_bar/drawer_bar.dart';

class ScheduleTourmanagerScreen extends StatelessWidget {
  const ScheduleTourmanagerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ScheduleTourmanagerCubit(GetIt.I<BookingRepository>())..loadSchedules(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lịch Trình'),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        drawer: DrawerBar(),
        body: BlocBuilder<ScheduleTourmanagerCubit, ScheduleTourmanagerState>(
          builder: (context, state) {
            if (state is ScheduleTourmanagerLoaded) {
              if (state.schedules.isEmpty) {
                return const Center(child: Text('Chưa có lịch trình nào.'));
              }
              return ListView(
                children: state.schedules
                    .map((schedule) => ScheduleTourmanagerCard(
                          shedule_tour_manager: schedule,
                          onDelete: () async {
                            final confirmed = await DialogNoti.confirm(
                              context: context,
                              title: 'Xác nhận xóa',
                              message: 'Bạn có chắc muốn xóa lịch trình này?',
                              highlightPhrases: ['xóa'],
                            );
                            if (confirmed) {
                              context.read<ScheduleTourmanagerCubit>().deleteSchedule(schedule);
                            }
                          },
                        ))
                    .toList(),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          icon: const Icon(Icons.add),
          label: const Text('Thêm'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

