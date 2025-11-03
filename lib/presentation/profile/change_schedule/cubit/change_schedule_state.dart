// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:booking_tour_flutter/domain/schedule_tourmanager.dart';

abstract class ChangeScheduleState {}

class ChangeScheduleLoadSuccess extends ChangeScheduleState {
  final List<ScheduleTourmanager> schedules;

  ChangeScheduleLoadSuccess({required this.schedules});

  ChangeScheduleLoadSuccess copyWith({List<ScheduleTourmanager>? schedules}) {
    return ChangeScheduleLoadSuccess(schedules: schedules ?? this.schedules);
  }
}

class ChangeScheduleLoadFail extends ChangeScheduleState {
  final String message;

  ChangeScheduleLoadFail({required this.message});
}

class ChangeScheduleLoading extends ChangeScheduleState {}
