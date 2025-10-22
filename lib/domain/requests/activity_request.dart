import 'package:json_annotation/json_annotation.dart';

part 'activity_request.g.dart';

@JsonSerializable()
class ActivityRequest {
  final String? action;

  ActivityRequest({required this.action});

  factory ActivityRequest.fromJson(Map<String, dynamic> json) =>
      _$ActivityRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityRequestToJson(this);
}
