import 'package:booking_tour_flutter/domain/location_activity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_location_activities_response.g.dart';

@JsonSerializable()
class UpdateLocationActivitiesResponse {
  final UpdateLocationActivitiesData? data;

  UpdateLocationActivitiesResponse({this.data});

  factory UpdateLocationActivitiesResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$UpdateLocationActivitiesResponseFromJson(json);
}

@JsonSerializable()
class UpdateLocationActivitiesData {
  int? id;
  String? name;

  UpdateLocationActivitiesData({this.id, this.name});

  factory UpdateLocationActivitiesData.fromJson(Map<String, dynamic> json) =>
      _$UpdateLocationActivitiesDataFromJson(json);
}

extension UpdateLocationActivitiesResponseMapper
    on UpdateLocationActivitiesResponse {
  LocationActivity? map() {
    if (data == null) return null;
    return LocationActivity(
      id: data!.id ?? 0,
      name: data!.name ?? "",
      place: PlaceActivity(
        id: 0,
        name: "",
        location: Location(id: 0, name: ""),
      ),
    );
  }
}
