import 'dart:ffi';

class ScheduleTourguide {
  final DateTime startDate;
  final DateTime endDate;
  final String idSchedule;
  final String location;
  final int quantity;
  final String imageUrl;
  ScheduleTourguide({
    required this.startDate,
    required this.endDate,
    required this.idSchedule,
    required this.quantity,
    required this.imageUrl,
    required this.location,
  });
}