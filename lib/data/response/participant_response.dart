import 'package:booking_tour_flutter/domain/participants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'participant_response.g.dart';

@JsonSerializable()
class UserCompletedScheduleResponse {
  String? startDate;
  String? endDate;
  String? code;
  String? name;
  String? avatarPath;
  List<BookingResponse>? booking;

  UserCompletedScheduleResponse({
    this.startDate,
    this.endDate,
    this.code,
    this.name,
    this.avatarPath,
    this.booking,
  });

  factory UserCompletedScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$UserCompletedScheduleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserCompletedScheduleResponseToJson(this);
}

@JsonSerializable()
class BookingResponse {
  int? userId;
  int? numPeople;
  String? phone;

  BookingResponse({
    this.userId,
    this.numPeople,
    this.phone,
  });

  factory BookingResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookingResponseToJson(this);
}

extension UserCompletedScheduleMapper on UserCompletedScheduleResponse {
  List<Participant> mapToParticipants() {
    if (booking == null || booking!.isEmpty) {
      return [];
    }

    String avatar = avatarPath ?? "";
    
    if (avatar.isNotEmpty && !avatar.startsWith('http')) {
      avatar = "http://tt1220-001-site1.ntempurl.com$avatar";
    }
    if (avatar.isEmpty) {
      avatar = "https://ui-avatars.com/api/?name=${Uri.encodeComponent(name ?? 'User')}&background=random";
    }

    return booking!.map((b) {
      return Participant(
        
        name: name ?? "Unknown",
        quantity: b.numPeople ?? 0,
        phoneNumber: b.phone ?? "N/A",
        avatarPath: avatar,
      );
    }).toList();
  }
}