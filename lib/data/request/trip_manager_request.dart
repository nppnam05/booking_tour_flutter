import 'package:json_annotation/json_annotation.dart';
import 'package:booking_tour_flutter/models/trip.dart';
part 'trip_manager_request.g.dart';
@JsonSerializable()
class TripManagerRequest {
  int? id;

  TripManagerRequest({this.id});

  factory TripManagerRequest.fromJson(Map<String, dynamic> json) =>
      _$TripManagerRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TripManagerRequestToJson(this);
}
