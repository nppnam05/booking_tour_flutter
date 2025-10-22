<<<<<<< HEAD:lib/data/reponse/location_activity_response.dart
import 'package:booking_tour_flutter/models/location_activity.dart';
=======
import 'package:booking_tour_flutter/domain/location_activity.dart';
import 'package:booking_tour_flutter/domain/place.dart';
>>>>>>> dev:lib/data/response/location_activity_response.dart
import 'package:json_annotation/json_annotation.dart';

part 'location_activity_response.g.dart';

@JsonSerializable()
class LocationActivityResponse {
  int? id;
  String? name;
  LocationActivityResponse({this.id, this.name});

  factory LocationActivityResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationActivityResponseFromJson(json);
}

extension LocationActivityResponseMapper on LocationActivityResponse {
  LocationActivity map() {
    return LocationActivity(id: id ?? 0, name: name ?? "");
  }
}
