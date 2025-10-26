
import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/schedule_tourguide.dart';
import 'schedule_tourguide_sate.dart';
import '../participants_screen.dart';

class ScheduleTourguideCubit extends Cubit<ScheduleTourguideState> {
  static final bookingRepository = getIt<BookingRepository>();

  ScheduleTourguideCubit() : super(ScheduleTourguideInitial());

  Future<void> loadSchedules({int staffId = 2}) async {
    emit(ScheduleTourguideLoading());

    final result = await bookingRepository.getSchedulesByStaff(staffId: staffId);

    result.fold(
      (failure) => emit(ScheduleTourguideError(failure.message)),
      (schedules) => emit(ScheduleTourguideLoaded(schedules)),
    );
  }

  void goToParticipants(BuildContext context, ScheduleTourguide schedule) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ParticipantsScreen(schedule: schedule),
      ),
    );
  }
}
