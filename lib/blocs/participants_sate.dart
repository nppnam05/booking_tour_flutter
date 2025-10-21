import 'package:booking_tour_flutter/models/participants.dart';

abstract class ParticipantsState {}

class ParticipantsInitial extends ParticipantsState {}

class ParticipantsLoaded extends ParticipantsState {
  final List<Participant> participants;
  final String scheduleCode;
  final DateTime startDate;
  final DateTime endDate;

  ParticipantsLoaded({
    required this.participants,
    required this.scheduleCode,
    required this.startDate,
    required this.endDate,
  });
}
