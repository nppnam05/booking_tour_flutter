// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:booking_tour_flutter/domain/booking.dart';
import 'package:booking_tour_flutter/domain/guide.dart';
import 'package:booking_tour_flutter/domain/user.dart';

class Review {
  final int rating;
  final String content;
  final DateTime createdAt;
  final User user;
  final List<Guide> guide;
  final Booking booking;
  Review({
    required this.rating,
    required this.content,
    required this.createdAt,
    required this.user,
    required this.guide,
    required this.booking,
  });
}
