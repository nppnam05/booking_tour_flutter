import 'package:booking_tour_flutter/domain/guide.dart';
import 'package:json_annotation/json_annotation.dart';

part 'guide_response.g.dart';

@JsonSerializable()
class GuideResponse {
  final int staffId;
  final int scheduleId;

  GuideResponse({required this.staffId, required this.scheduleId});

  factory GuideResponse.fromJson(Map<String, dynamic> json) => _$GuideResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$GuideResponseToJson(this);
}

extension GuideResponseMapper on GuideResponse {
  Guide map() {
    return Guide(staffId: staffId, scheduleId: scheduleId);
  }
}