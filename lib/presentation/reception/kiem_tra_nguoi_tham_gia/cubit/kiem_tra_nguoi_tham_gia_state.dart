import 'package:booking_tour_flutter/domain/user_completed_schedule.dart';

class KiemTraNguoiThamGiaState {
  final List<UserCompletedSchedule> userCompletedSchedule;
  bool? isLoading = true;

  KiemTraNguoiThamGiaState({required this.userCompletedSchedule, this.isLoading});

  KiemTraNguoiThamGiaState copyWith({
    List<UserCompletedSchedule>? userCompletedSchedule,
    bool? isLoading
  }) {
    return KiemTraNguoiThamGiaState(
      userCompletedSchedule:
          userCompletedSchedule ?? this.userCompletedSchedule,
      isLoading: isLoading ?? this.isLoading
    );
  }
}
