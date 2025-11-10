import 'package:booking_tour_flutter/domain/schedule_user_completed.dart';
import 'package:booking_tour_flutter/domain/trip.dart';

class LichTrinhDaHoanThanhState {
  final List<Trip> tour;
  final List<ScheduleUserCompleted> schedule;

  LichTrinhDaHoanThanhState({
    required this.tour,
    required this.schedule,
  });

  LichTrinhDaHoanThanhState copyWith({
    List<Trip>? tour,
    List<ScheduleUserCompleted>? schedule,
  }) {
    return LichTrinhDaHoanThanhState(
      tour: tour ?? this.tour,
      schedule: schedule ?? this.schedule,
    );
  }
}
