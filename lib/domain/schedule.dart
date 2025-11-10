import 'package:booking_tour_flutter/domain/schedule_assignment_tourguide.dart';

class Schedule {
  final String title;
  final String location;
  final String imageUrl;
  final DateTime startDate;
  final DateTime endDate;
  final int capacity;
  final Tour tour;

  Schedule({
    required this.title,
    required this.location,
    required this.imageUrl,
    required this.startDate,
    required this.endDate,
    required this.capacity,
    required this.tour,
  });
}
