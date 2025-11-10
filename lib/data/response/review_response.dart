import 'package:booking_tour_flutter/data/response/booking_response.dart';
import 'package:booking_tour_flutter/data/response/guide_response.dart';
import 'package:booking_tour_flutter/data/response/user_response.dart';
import 'package:booking_tour_flutter/domain/booking.dart';
import 'package:booking_tour_flutter/domain/review.dart';
import 'package:booking_tour_flutter/domain/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_response.g.dart';

@JsonSerializable()
class ReviewResponse {
  int? rating;
  String? content;
  DateTime? createdAt;
  UserResponse? user;
  List<GuideResponse>? guide;
  BookingResponse? booking;

  ReviewResponse({
    this.rating,
    this.content,
    this.createdAt,
    this.user,
    this.guide,
    this.booking,
  });

  factory ReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewResponseToJson(this);
}

extension ReviewResponseMapper on ReviewResponse {
  Review map() {
    return Review(
      rating: rating ?? 0,
      content: content ?? '',
      createdAt: createdAt ?? DateTime.now(),
      user: user?.map() ?? User.empty(),
      guide: guide?.map((e) => e.map()).toList() ?? [],
      booking: booking?.map() ?? Booking.empty(),
    );
  }
}
