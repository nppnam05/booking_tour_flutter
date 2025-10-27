import 'package:booking_tour_flutter/domain/trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/schedule_bloc.dart'; // Đổi tên file nếu cần
import '../../presentation/widgets_dialog/dialog_noti.dart';
import 'schedule_card.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ScheduleBloc()..add(LoadSchedules()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lịch Trình'),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ),
        body: BlocBuilder<ScheduleBloc, ScheduleState>(
          builder: (context, state) {
            if (state is ScheduleLoaded) {
              if (state.schedules.isEmpty) {
                return const Center(child: Text('Chưa có lịch trình nào.'));
              }
              return ListView(
                children: state.schedules
                    .map((schedule) => ScheduleCard(
                          trip: schedule,
                          onDelete: () async {
                            final confirmed = await DialogNoti.confirm(
                              context: context,
                              title: 'Xác nhận xóa',
                              message: 'Bạn có chắc muốn xóa lịch trình này?',
                              highlightPhrases: ['xóa'],
                            );
                            if (confirmed) {
                              context.read<ScheduleBloc>().add(DeleteSchedule(schedule));
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
          onPressed: () {
            
          },
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
