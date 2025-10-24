import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/schedule.dart';

// Events
abstract class ScheduleEvent {}

class LoadSchedules extends ScheduleEvent {}

class DeleteSchedule extends ScheduleEvent {
  final Schedule schedule;
  DeleteSchedule(this.schedule);
}

// States
abstract class ScheduleState {}

class ScheduleInitial extends ScheduleState {}

class ScheduleLoaded extends ScheduleState {
  final List<Schedule> schedules;
  ScheduleLoaded(this.schedules);
}

// Bloc
class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final List<Schedule> _list = [
    Schedule(
      title: 'Du lịch Hạ Long',
      location: 'Hạ Long',
      imageUrl: 'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=400',
      startDate: DateTime(2024, 10, 17),
      endDate: DateTime(2024, 10, 20),
      capacity: 100,
    ),
    Schedule(
      title: 'Khám phá Hà Nội',
      location: 'Hà Nội',
      imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400',
      startDate: DateTime(2024, 10, 17),
      endDate: DateTime(2024, 10, 20),
      capacity: 100,
    ),
    Schedule(
      title: 'Du lịch Đà Nẵng',
      location: 'Đà Nẵng',
      imageUrl: 'https://images.unsplash.com/photo-1528127269322-539801943592?w=400',
      startDate: DateTime(2024, 10, 17),
      endDate: DateTime(2024, 10, 20),
      capacity: 100,
    ),
  ];

  ScheduleBloc() : super(ScheduleInitial()) {
    on<LoadSchedules>((event, emit) {
      emit(ScheduleLoaded(List.from(_list)));
    });

    on<DeleteSchedule>((event, emit) {
      _list.remove(event.schedule);
      emit(ScheduleLoaded(List.from(_list)));
    });
  }
}
