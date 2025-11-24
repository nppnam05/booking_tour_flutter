import 'package:booking_tour_flutter/domain/schedule_reception.dart';
import 'package:booking_tour_flutter/domain/user_completed_schedule.dart';

class LichTrinhChuaHoanThanhState {
  final List<ScheduleReception> scheduleReception;
  final Map<int, List<UserCompletedSchedule>> userCompletedSchedule;
  bool? isLoading = true;

  LichTrinhChuaHoanThanhState({required this.scheduleReception, required this.userCompletedSchedule, this.isLoading});

  LichTrinhChuaHoanThanhState copyWith({List<ScheduleReception>? scheduleReception, Map<int, List<UserCompletedSchedule>>? userCompletedSchedule, bool? isLoading}) {
    return LichTrinhChuaHoanThanhState(
      scheduleReception: scheduleReception ?? this.scheduleReception,
      userCompletedSchedule: userCompletedSchedule ?? this.userCompletedSchedule,
      isLoading: isLoading ?? this.isLoading
    );
  }
}
