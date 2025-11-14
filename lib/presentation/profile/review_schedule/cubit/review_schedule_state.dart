// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:booking_tour_flutter/domain/schedule_tourmanager.dart';
import 'package:booking_tour_flutter/domain/schedule_user_completed.dart';
import 'package:booking_tour_flutter/domain/trip.dart';

class ReviewScheduleState {
  final int stars;
  final String review;
  final int userId;
  final ScheduleTourmanager? schedule;
  final bool sentReview;
  final String? errorMessage;

  ReviewScheduleState({
    required this.stars,
    required this.review,
    this.userId = 0,
    this.schedule ,
    this.sentReview = false,
    this.errorMessage,
  });

  ReviewScheduleState copyWith({
    int? stars,
    String? review,
    int? userId,
    ScheduleTourmanager? schedule,
    bool? sentReview,
    String? errorMessage,
  }) {
    return ReviewScheduleState(
      stars: stars ?? this.stars,
      review: review ?? this.review,
      userId: userId ?? this.userId,
      schedule: schedule ?? this.schedule,
      sentReview: sentReview ?? this.sentReview,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
