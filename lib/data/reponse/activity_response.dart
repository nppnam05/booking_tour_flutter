import 'package:booking_tour_flutter/domain/model/activity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'activity_response.g.dart';

@JsonSerializable()
class ActivityResponse {
  ActivityResponseResult? result;
  ActivityResponse();
  factory ActivityResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivityResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ActivityResponseToJson(this);
}

@JsonSerializable()
class ActivityResponseResult {
  ActivityResponseData? data;
  ActivityResponseResult();
  factory ActivityResponseResult.fromJson(Map<String, dynamic> json) =>
      _$ActivityResponseResultFromJson(json);
  Map<String, dynamic> toJson() => _$ActivityResponseResultToJson(this);
}

@JsonSerializable()
class ActivityResponseData {
  List<ActivityResponseItem>? data;

  ActivityResponseData();
  factory ActivityResponseData.fromJson(Map<String, dynamic> json) =>
      _$ActivityResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityResponseDataToJson(this);
}

@JsonSerializable()
class ActivityResponseItem {
  int? id;
  String? action;

  ActivityResponseItem();

  factory ActivityResponseItem.fromJson(Map<String, dynamic> json) =>
      _$ActivityResponseItemFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityResponseItemToJson(this);
}

extension ActivityResponseItemMapper on ActivityResponseItem {
  ActivityItem toDomain() {
    return ActivityItem(id: id ?? 0, action: action ?? '');
  }
}

extension ActivityResponseDataMapper on ActivityResponseData {
  List<ActivityItem> toDomain() {
    return data
            ?.map((activityResponseItem) => activityResponseItem.toDomain())
            .toList() ??
        [];
  }
}
