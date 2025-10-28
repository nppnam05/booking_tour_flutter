import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/domain/tour_assignment.dart';
import 'package:booking_tour_flutter/presentation/assignment/schedule_assignment/cubit/schedule_assignment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleAssignmentCubit extends Cubit<ScheduleAssignmentState> {
  static final ScheduleAssignment = getIt<BookingRepository>();

  ScheduleAssignmentCubit()
    : super(
        ScheduleAssignmentState(
          tour: TourAssignment.empty(),
          tourId: 0,
          schedules: [],
        ),
      );

  // đọc dữ liệu từ api
  Future<void> loadData(int tourId) async {
    var tour = await ScheduleAssignment.getTourAssignmentByTourId(
      tourId: tourId,
    );

    tour.fold((failure) {}, (tour) {
      emit(state.copyWith(tour: tour));
    });

    var scheduleAssignment =
        await ScheduleAssignment.getScheduleAssignmentsByTourId(tourId: tourId);

    scheduleAssignment.fold((failure) {}, (schedules) {
      emit(state.copyWith(schedules: schedules));
    });
  }
}
