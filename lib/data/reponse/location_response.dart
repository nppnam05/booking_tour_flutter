import 'package:booking_tour_flutter/domain/location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_response.g.dart';

@JsonSerializable()
class LocationListResponse {
  final List<LocationResponse>? data;

  LocationListResponse({this.data});

  factory LocationListResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationListResponseFromJson(json);
}

@JsonSerializable()
class LocationResponse {
  @JsonKey(name: "id")
  final int? locationId;
  final String? name;
  
  LocationResponse({
    this.locationId,
    this.name
  });

  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseFromJson(json);

}

extension LocationResponseDataMap on LocationListResponse {
  List<Location> map() {
    var list = data?.map((i) => i.map()).toList() ?? [];
    return list;
  }
}

extension LocationResponseMap on LocationResponse{
  Location map(){
    return Location(locationId: locationId ??  0, name: name ?? "");
  }
}