// lib/presentation/admin/schedule_review_detail/cubit/schedule_review_detail_cubit.dart
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/domain/schedule_tourguide.dart';  // ✅ Import đúng
import 'package:flutter_bloc/flutter_bloc.dart';
import 'schedule_review_detail_state.dart';

class ScheduleReviewDetailCubit extends Cubit<ScheduleReviewDetailState> {
  final BookingRepository _repository;
  final ScheduleTourguide schedule;  // ✅ Dùng ScheduleTourguide

  ScheduleReviewDetailCubit(this._repository, this.schedule)
      : super(ScheduleReviewDetailInitial());

  Future<void> loadReviews() async {
    emit(ScheduleReviewDetailLoading());

    try {
      final result = await _repository.getReviewsByScheduleId(
        scheduleId: schedule.id,  // ✅ schedule.id có sẵn rồi!
      );

      result.fold(
        (failure) => emit(ScheduleReviewDetailError(failure.message)),
        (reviews) => emit(ScheduleReviewDetailLoaded(
          reviews: reviews,
          schedule: schedule,
        )),
      );
    } catch (e) {
      emit(ScheduleReviewDetailError('Đã có lỗi xảy ra: ${e.toString()}'));
    }
  }

  void filterByStar(int? star) {
    final currentState = state;
    if (currentState is ScheduleReviewDetailLoaded) {
      emit(currentState.copyWith(
        selectedStarFilter: star,
        clearFilter: star == null,
      ));
    }
  }
}