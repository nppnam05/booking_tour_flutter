// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:booking_tour_flutter/domain/schedule_detail.dart';

class ScheduleDetailState {
  int daySelected;
  ScheduleDetail scheduleDetail;
  bool isLoading;

  ScheduleDetailState({
    required this.daySelected,
    required this.scheduleDetail,
    required this.isLoading
  });

  copyWith({
    int? daySelected,
    ScheduleDetail? scheduleDetail,
    bool? isLoading
  }) {
    return ScheduleDetailState(
      daySelected: daySelected ?? this.daySelected,
      scheduleDetail: scheduleDetail ?? this.scheduleDetail,
      isLoading: isLoading ?? this.isLoading
    );
  }
}
