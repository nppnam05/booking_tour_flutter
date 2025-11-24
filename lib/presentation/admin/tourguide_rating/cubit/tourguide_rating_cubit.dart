import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/domain/staff.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'tourguide_rating_state.dart';

class TourguideRatingCubit extends Cubit<TourguideRatingState> {
  final BookingRepository _repository;
  final int staffId = 2; // Hard-coded for now
  TourguideRatingCubit(this._repository) : super(TourguideRatingInitial());

 Future<void> loadStaffInfo() async {
  try {
    final result = await _repository.getStaffById(id: staffId);

    result.fold(
      (failure) => print("Failed to load staff: ${failure.message}"),
      (staffData) {
        final current = state;
        if (current is TourguideRatingLoaded) {
          emit(current.copyWith(staff: staffData));
        }
      },
    );
  } catch (e) {
    print("Error loading staff: $e");
  }
}


  Future<void> loadSchedules({
    String? filter,
    int? provinceId,
    String? provinceName,
    DateTime? startDate,
    DateTime? endDate,
    int? stars,
  }) async {
    emit(TourguideRatingLoading());

    try {
      final result = await _repository.getSchedulesByStaffWithFilter(
        staffId: staffId,
        filter: filter,
        provinceId: provinceId,
        startDate: startDate,
        endDate: endDate,
        stars: stars,
      );

      result.fold(
        (failure) => emit(TourguideRatingError(failure.message)),
        (schedules) {
          emit(
            TourguideRatingLoaded(
              schedules: schedules,
              filterText: filter,
              provinceId: provinceId,
              provinceName: provinceName,
              startDate: startDate,
              endDate: endDate,
              stars: stars,
              staff: null, // Will be loaded separately
            ),
          );
          // Load staff info after schedules
          loadStaffInfo();
        },
      );
    } catch (e) {
      emit(TourguideRatingError("Đã có lỗi xảy ra: ${e.toString()}"));
    }
  }

  void applyFilter({
    int? provinceId,
    String? provinceName,
    DateTime? startDate,
    DateTime? endDate,
    int? stars,
  }) {
    final currentState = state;
    if (currentState is TourguideRatingLoaded) {
      loadSchedules(
        filter: currentState.filterText,
        provinceId: provinceId,
        provinceName: provinceName,
        startDate: startDate,
        endDate: endDate,
        stars: stars,
      );
    }
  }

  void searchSchedules(String query) {
    final currentState = state;
    if (currentState is TourguideRatingLoaded) {
      loadSchedules(
        filter: query,
        provinceId: currentState.provinceId,
        provinceName: currentState.provinceName,
        startDate: currentState.startDate,
        endDate: currentState.endDate,
        stars: currentState.stars,
      );
    }
  }
}