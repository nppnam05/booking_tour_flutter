

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/schedule_tourguide.dart';
import '../blocs/schedule_tourguide_sate.dart';
import '../presentation/tour_guide/participants_screen.dart';

class ScheduleTourguideCubit extends Cubit<ScheduleTourguideState> {
  ScheduleTourguideCubit() : super(ScheduleTourguideInitial());

  final List<ScheduleTourguide> _list = [
    ScheduleTourguide(
      startDate: DateTime(2024, 10, 17),
      endDate: DateTime(2024, 10, 20),
      idSchedule: 'SCH001',
      location: 'Hạ Long',
      quantity: 20,
      imageUrl: 'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=400',
    ),
    ScheduleTourguide(
      startDate: DateTime(2024, 11, 5),
      endDate: DateTime(2024, 11, 10),
      idSchedule: 'SCH002',
      location: 'Hà Nội',
      quantity: 15,
      imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400',
    ),
    ScheduleTourguide(
      startDate: DateTime(2024, 12, 1),
      endDate: DateTime(2024, 12, 5),
      idSchedule: 'SCH003',
      location: 'Đà Nẵng',
      quantity: 25,
      imageUrl: 'https://images.unsplash.com/photo-1528127269322-539801943592?w=400',
    ),
  ];

  void loadSchedules() {
    emit(ScheduleTourguideLoaded(List.from(_list)));
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
