import 'package:booking_tour_flutter/domain/actualcash.dart';
import 'package:booking_tour_flutter/domain/booking.dart';

class UserCompletedSchedule {
  int? countPeople;
  Booking? booking;
  Actualcash? actualcashs;

  UserCompletedSchedule({required this.countPeople,required this.booking, required this.actualcashs}){
    this.countPeople = countPeople;
    this.booking = booking;
    this.actualcashs = actualcashs;
  }
  static UserCompletedSchedule empty() {
    return UserCompletedSchedule(
      countPeople: 0,
      booking: Booking.empty(),
      actualcashs: Actualcash.empty()
    );
  }
}