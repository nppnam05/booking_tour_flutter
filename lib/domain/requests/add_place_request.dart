import "package:json_annotation/json_annotation.dart";

part "add_place_request.g.dart";

@JsonSerializable()
class AddPlaceRequest {
  String name;
  int locationId;

  AddPlaceRequest({required this.name, required this.locationId});
  factory AddPlaceRequest.fromJson(Map<String, dynamic> json) =>
      _$AddPlaceRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AddPlaceRequestToJson(this);
}
