import 'package:booking_tour_flutter/domain/participants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/participants_sate.dart';

class ParticipantsCubit extends Cubit<ParticipantsState> {
  ParticipantsCubit() : super(ParticipantsInitial());

  void loadParticipants(String scheduleCode, DateTime start, DateTime end) {
    final List<Participant> mockData = [
      Participant(
        name: 'Tình',
        quantity: 5,
        phoneNumber: '0123456789',
        avatarUrl: 'https://www.pinterest.com/pin/26317979068631760/',
      ),
      Participant(
        name: 'Tình',
        quantity: 5,
        phoneNumber: '0158587555',
        avatarUrl: 'https://www.pinterest.com/pin/26317979068631760/',
      ),
    ];

    emit(ParticipantsLoaded(
      participants: mockData,
      scheduleCode: scheduleCode,
      startDate: start,
      endDate: end,
    ));
  }
}