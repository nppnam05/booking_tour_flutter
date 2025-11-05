
import 'package:booking_tour_flutter/domain/day_of_tour.dart';
import 'package:booking_tour_flutter/domain/province.dart';

class Trip {
  final int id;
  final int day;
  final String title;
  final int price;
  final int percentDeposit;
  final String description;
  final List<Province> provinces;
  final List<String> tourImages;
  final List<DayOfTour> dayOfTours;
  final int totalReviews ; 
  final int totalStars; 
  Trip({
    required this.id,
    required this.day,
    required this.title,
    required this.price,
    required this.percentDeposit,
    required this.description,
    required this.provinces,
    required this.tourImages,
    required this.dayOfTours,
    required this.totalReviews,
    required this.totalStars,
  });
}
