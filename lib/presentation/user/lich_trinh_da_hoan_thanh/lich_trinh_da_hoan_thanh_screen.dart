import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/app_font.dart';
import 'package:booking_tour_flutter/domain/schedule_user_completed.dart';
import 'package:booking_tour_flutter/presentation/auth/auth_cubit.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/assignment/schedule_assignment/cubit/schedule_assignment_cubit.dart';
import 'package:booking_tour_flutter/presentation/user/lich_trinh_da_hoan_thanh/cubit/lich_trinh_da_hoan_thanh_cubit.dart';
import 'package:booking_tour_flutter/presentation/user/lich_trinh_da_hoan_thanh/cubit/lich_trinh_da_hoan_thanh_state.dart';
import 'package:booking_tour_flutter/presentation/widget_use_for_many_screen/delete_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LichTrinhDaHoanThanhScreen extends StatelessWidget {
  final _cubit = LichTrinhDaHoanThanhCubit();
  @override
  Widget build(BuildContext context) {
    final userId = context.read<AuthCubit>().state.id;
    _cubit.syncSchedule(userId);

    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        appBar: AppBar(title: Text("Lịch trình đã hoàn thành")),
        body: BlocBuilder<LichTrinhDaHoanThanhCubit, LichTrinhDaHoanThanhState>(
          builder: (context, state) {
            return _buildListScheduleCompleted(state.schedule);
          },
        ),
        backgroundColor: AppColors.secondary,
      ),
    );
  }

  Widget _buildListScheduleCompleted(List<ScheduleUserCompleted> schedules) {
    return ListView.builder(
      itemCount: schedules.length,
      itemBuilder: (context, index) {
        final schedule = schedules[index];
        return _buildCardSchedule(context, schedule);
      },
    );
  }

  Widget _buildCardSchedule(
    BuildContext context,
    ScheduleUserCompleted schedule,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.scaffoldBackgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    schedule.tour.tourImages.first,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(color: Colors.black);
                    },
                  ),
                ),
              ),

              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "<> ",
                    style: AppFonts.text20.copyWith(color: AppColors.info),
                  ),
                  Text("Mã lịch trình: ", style: AppFonts.text20),
                  Text(schedule.code, style: AppFonts.text20),
                ],
              ),

              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.park,
                    size: 20,
                    color: AppColors.backgroundAppBarTheme,
                  ),
                  Text(" ${schedule.tour.title}", style: AppFonts.text20),
                ],
              ),

              SizedBox(height: 5),
              Row(
                children: [
                  Icon(Icons.location_city, size: 20, color: AppColors.delete),
                  Text(
                    " ${schedule.tour.provinces.first.name}",
                    style: AppFonts.text20,
                  ),
                ],
              ),

              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.money_sharp,
                    size: 20,
                    color: AppColors.borderButton,
                  ),
                  Text(
                    " ${schedule.finalPrice}",
                    style: AppFonts.text20.copyWith(color: AppColors.delete),
                  ),
                  Text(
                    " VNĐ",
                    style: AppFonts.text20.copyWith(color: AppColors.delete),
                  ),
                ],
              ),
              _buildButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        DeleteButtonWidget(
          onDelete: () {
            Navigator.pop(context);
          },
          text: "Đặt Lại",
          textColor: Colors.white,
          backgroundColor: AppColors.backgroundAppBarTheme,
        ),
        SizedBox(width: 10),
        DeleteButtonWidget(
          onDelete: () {
            Navigator.pop(context);
          },
          text: "Đánh Giá",
          textColor: Colors.white,
          backgroundColor: AppColors.borderButton,
        ),
      ],
    );
  }
}
