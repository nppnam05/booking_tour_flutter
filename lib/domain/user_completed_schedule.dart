import 'package:booking_tour_flutter/domain/actualcash.dart';
import 'package:booking_tour_flutter/domain/booking.dart';

class UserCompletedSchedule {
  int? countPeople;
  Booking? booking;
  Actualcash? actualcash;

  UserCompletedSchedule({required this.countPeople,required this.booking, required this.actualcash}){
    this.countPeople = countPeople;
    this.booking = booking;
    this.actualcash = actualcash;
  }
  static UserCompletedSchedule empty() {
    return UserCompletedSchedule(
      countPeople: 0,
      booking: Booking.empty(),
      actualcash: Actualcash.empty()
    );
  }
}