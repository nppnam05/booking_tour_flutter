import 'package:booking_tour_flutter/domain/location_activity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'add_location_activity_response.g.dart';

@JsonSerializable()
class AddLocationActivityResponse {
  int? id;
  String? name;
  PlaceActivityResponse? place;

  AddLocationActivityResponse({this.id, this.name, this.place});

  factory AddLocationActivityResponse.fromJson(Map<String, dynamic> json) =>
      _$AddLocationActivityResponseFromJson(json);
}

@JsonSerializable()
class PlaceActivityResponse {
  int? id;
  String? name;
  LocationResponse? location;

  PlaceActivityResponse({this.id, this.name, this.location});

  factory PlaceActivityResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaceActivityResponseFromJson(json);
}

@JsonSerializable()
class LocationResponse {
  int? id;
  String? name;

  LocationResponse({this.id, this.name});

  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseFromJson(json);
}

extension AddLocationActivityResponseMapper on AddLocationActivityResponse {
  LocationActivity map() {
    return LocationActivity(
      id: id ?? 0,
      name: name ?? "",
      place:
          place?.map() ??
          PlaceActivity(id: 0, name: "", location: Location(id: 0, name: "")),
    );
  }
}

extension PlaceActivityResponseMapper on PlaceActivityResponse {
  PlaceActivity map() {
    return PlaceActivity(
      id: id ?? 0,
      name: name ?? "",
      location: location?.map() ?? Location(id: 0, name: ""),
    );
  }
}

extension LocationResponseMapper on LocationResponse {
  Location map() {
    return Location(id: id ?? 0, name: name ?? "");
  }
}
