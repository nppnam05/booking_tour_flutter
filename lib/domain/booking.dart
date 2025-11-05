// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:booking_tour_flutter/domain/booking_status.dart';
import 'package:booking_tour_flutter/domain/schedule.dart';
import 'package:booking_tour_flutter/domain/schedule_tourmanager.dart';
import 'package:booking_tour_flutter/domain/user.dart';

class Booking {
  int id;
  int numPeople;
  String code;
  String email;
  String phone;
  int totalPrice;
  int countChangeLeft;
  DateTime createdAt;
  BookingStatus status;
  ScheduleTourmanager schedule;
  User user;

  Booking({
    required this.id,
    required this.numPeople,
    required this.code,
    required this.email,
    required this.phone,
    required this.totalPrice,
    required this.countChangeLeft,
    required this.createdAt,
    required this.status,
    required this.schedule,
    required this.user,
  });

  factory Booking.empty() {
    return Booking(
      id: 0,
      numPeople: 0,
      code: "",
      email: "",
      phone: "",
      totalPrice: 0,
      countChangeLeft: 0,
      createdAt: DateTime.now(),
      status: BookingStatus.empty(),
      schedule: ScheduleTourmanager.empty(),
      user: User.empty(),
    );
  }
}
