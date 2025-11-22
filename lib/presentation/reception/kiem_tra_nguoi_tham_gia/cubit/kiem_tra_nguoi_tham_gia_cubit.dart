import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/domain/user_completed_schedule.dart';
import 'package:booking_tour_flutter/presentation/reception/kiem_tra_nguoi_tham_gia/cubit/kiem_tra_nguoi_tham_gia_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KiemTraNguoiThamGiaCubit extends Cubit<KiemTraNguoiThamGiaState> {
  final bookingRepository = getIt<BookingRepository>();

  KiemTraNguoiThamGiaCubit()
    : super(KiemTraNguoiThamGiaState(userCompletedSchedule: []));

  Future<void> syncBooking(int scheduleId) async {
    var result = await bookingRepository.getUserCompletedScheduleByScheduleId(
      scheduleId: scheduleId,
    );

    result.fold((fail) {}, (userCompletedSchedule) {
      emit(
        state.copyWith(
          userCompletedSchedule: userCompletedSchedule,
          isLoading: false,
        ),
      );
    });
  }
}
