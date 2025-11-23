import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/domain/user_completed_schedule.dart';
import 'package:booking_tour_flutter/presentation/reception/xac_nhan_so_nguoi_tham_gia/cubit/xac_nhan_so_nguoi_tham_gia_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XacNhanSoNguoiThamGiaCubit extends Cubit<XacNhanSoNguoiThamGiaState>{
  final bookingRepository = getIt<BookingRepository>();

  XacNhanSoNguoiThamGiaCubit() : super(XacNhanSoNguoiThamGiaState(userCompletedSchedule: UserCompletedSchedule.empty()));

  void setUserCompletedSchedule(UserCompletedSchedule userComp){
    emit(state.copyWith(userCompletedSchedule: userComp));
  }

  Future<void> updateUserCompleted(int bookingId, int countPeople) async {
    var result = await bookingRepository.updateUserCompletedScheduleCountPeople(bookingId: bookingId, countPeople: countPeople);

    result.fold((e){
      emit(state.copyWith(isState: false));
    },
    (usercomp){
      emit(state.copyWith(isState: true));
    });
  }
}