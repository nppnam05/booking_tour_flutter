import 'package:booking_tour_flutter/domain/user_completed_schedule.dart';

class XacNhanSoNguoiThamGiaState {
  final UserCompletedSchedule userCompletedSchedule;
  bool? isState;

  XacNhanSoNguoiThamGiaState({required this.userCompletedSchedule,this.isState});

  XacNhanSoNguoiThamGiaState copyWith({UserCompletedSchedule? userCompletedSchedule, bool? isState}){
    return XacNhanSoNguoiThamGiaState(userCompletedSchedule: userCompletedSchedule ?? this.userCompletedSchedule, isState: isState ?? this.isState);
  }
}