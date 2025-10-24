import 'package:json_annotation/json_annotation.dart';
part 'add_location_activity_request.g.dart';

@JsonSerializable()
class AddLocationActivityRequest {
  final String name;
  final int placeId;
  final List<int> activityIds;

  AddLocationActivityRequest({
    required this.name,
    required this.placeId,
    required this.activityIds,
  });

  factory AddLocationActivityRequest.fromJson(Map<String, dynamic> json) =>
      _$AddLocationActivityRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddLocationActivityRequestToJson(this);
}
