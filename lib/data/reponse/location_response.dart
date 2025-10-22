import 'package:booking_tour_flutter/domain/location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_response.g.dart';

@JsonSerializable(createToJson: false)
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

extension LocationResponseMap on LocationResponse{
  Location map(){
    return Location(locationId: locationId ??  0, name: name ?? "");
  }
}