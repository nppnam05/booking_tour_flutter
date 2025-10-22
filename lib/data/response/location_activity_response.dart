import 'package:booking_tour_flutter/models/location_activity.dart';

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
