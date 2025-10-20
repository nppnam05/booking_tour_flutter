import '../models/schedule_tourguide.dart';

abstract class ScheduleTourguideState {}

class ScheduleTourguideInitial extends ScheduleTourguideState {}

class ScheduleTourguideLoaded extends ScheduleTourguideState {
  final List<ScheduleTourguide> schedules;
  ScheduleTourguideLoaded(this.schedules);
}
