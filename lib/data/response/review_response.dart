import 'package:booking_tour_flutter/data/response/booking_response.dart';
import 'package:booking_tour_flutter/data/response/guide_response.dart';
import 'package:booking_tour_flutter/data/response/user_response.dart';
import 'package:booking_tour_flutter/domain/booking.dart';
import 'package:booking_tour_flutter/domain/guide.dart';
import 'package:booking_tour_flutter/domain/review.dart';
import 'package:booking_tour_flutter/domain/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_response.g.dart';

@JsonSerializable()
class ReviewResponse {
  int? id;
  int? rating;
  String? content;
  DateTime? createdAt;
  UserResponse? user;
  GuideResponse? guide;
  BookingResponse? booking;
  bool? isHelpful;

  ReviewResponse({
    this.id,
    this.rating,
    this.content,
    this.createdAt,
    this.user,
    this.guide,
    this.booking,
    this.isHelpful,
  });

  factory ReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewResponseToJson(this);
}

extension ReviewResponseMapper on ReviewResponse {
  Review map() {
    return Review(
      id: id ?? 0,
      rating: rating ?? 0,
      content: content ?? '',
      createdAt: createdAt ?? DateTime.now(),
      user: user?.map() ?? User.empty(),
      guide: guide?.map() ?? Guide.empty(),
      booking: booking?.map() ?? Booking.empty(),
      isHelpful: isHelpful ?? false,
    );
  }
}
