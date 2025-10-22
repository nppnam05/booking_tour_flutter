// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityResponse _$ActivityResponseFromJson(Map<String, dynamic> json) =>
    ActivityResponse()
      ..result =
          json['result'] == null
              ? null
              : ActivityResponseResult.fromJson(
                json['result'] as Map<String, dynamic>,
              );

Map<String, dynamic> _$ActivityResponseToJson(ActivityResponse instance) =>
    <String, dynamic>{'result': instance.result};

ActivityResponseResult _$ActivityResponseResultFromJson(
  Map<String, dynamic> json,
) =>
    ActivityResponseResult()
      ..data =
          json['data'] == null
              ? null
              : ActivityResponseData.fromJson(
                json['data'] as Map<String, dynamic>,
              );

Map<String, dynamic> _$ActivityResponseResultToJson(
  ActivityResponseResult instance,
) => <String, dynamic>{'data': instance.data};

ActivityResponseData _$ActivityResponseDataFromJson(
  Map<String, dynamic> json,
) =>
    ActivityResponseData()
      ..data =
          (json['data'] as List<dynamic>?)
              ?.map(
                (e) => ActivityResponseItem.fromJson(e as Map<String, dynamic>),
              )
              .toList();

Map<String, dynamic> _$ActivityResponseDataToJson(
  ActivityResponseData instance,
) => <String, dynamic>{'data': instance.data};

ActivityResponseItem _$ActivityResponseItemFromJson(
  Map<String, dynamic> json,
) =>
    ActivityResponseItem()
      ..id = (json['id'] as num?)?.toInt()
      ..action = json['action'] as String?;

Map<String, dynamic> _$ActivityResponseItemToJson(
  ActivityResponseItem instance,
) => <String, dynamic>{'id': instance.id, 'action': instance.action};
