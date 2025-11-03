import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/presentation/profile/change_schedule/cubit/change_schedule_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeScheduleCubit extends Cubit<ChangeScheduleState> {
  final BookingRepository _repository = getIt<BookingRepository>();
  ChangeScheduleCubit() : super(ChangeScheduleLoadSuccess(schedules: []));

  Future<void> loadData() async {
    var result = await _repository.getAllSchedule();

    ChangeScheduleLoadSuccess? newState;
    if (state is ChangeScheduleLoadSuccess) {
      newState = state as ChangeScheduleLoadSuccess;
    } else {
      newState = ChangeScheduleLoadSuccess(schedules: []);
    }

    result.fold(
      (failure) {
        emit(
          ChangeScheduleLoadFail(
            message: "Xảy ra lỗi trong quá trình tải dữ liệu",
          ),
        );
      },
      (schedules) {
        emit(newState!.copyWith(schedules: schedules));
      },
    );
  }
}
