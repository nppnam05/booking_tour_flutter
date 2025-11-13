// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:booking_tour_flutter/domain/pay_booking.dart';
import 'package:booking_tour_flutter/domain/schedule_book.dart';

class PayScheduleState {
  final PayBooking paySchedule;
  final ScheduleBook schedule;
  final String linkQR;
  final int idSchedule;
  final int idBooking;
  PayScheduleState({
    required this.paySchedule,
    required this.schedule,
    required this.linkQR,
    required this.idSchedule,
    required this.idBooking,
  });

  PayScheduleState copyWith({
    PayBooking? paySchedule,
    ScheduleBook? schedule,
    String? linkQR,
    int? idSchedule,
    int? idBooking,
  }) {
    return PayScheduleState(
      paySchedule: paySchedule ?? this.paySchedule,
      schedule: schedule ?? this.schedule,
      linkQR: linkQR ?? this.linkQR,
      idSchedule: idSchedule ?? this.idSchedule,
      idBooking: idBooking ?? this.idBooking,
    );
  }
}
