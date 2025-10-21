// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityResponse _$ActivityResponseFromJson(Map<String, dynamic> json) =>
    ActivityResponse(
      data:
          (json['data'] as List<dynamic>?)
              ?.map(
                (e) => ActivityResponseData.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );

Map<String, dynamic> _$ActivityResponseToJson(ActivityResponse instance) =>
    <String, dynamic>{'data': instance.data};

ActivityResponseData _$ActivityResponseDataFromJson(
  Map<String, dynamic> json,
) => ActivityResponseData(
  id: (json['id'] as num?)?.toInt(),
  action: json['action'] as String?,
);

Map<String, dynamic> _$ActivityResponseDataToJson(
  ActivityResponseData instance,
) => <String, dynamic>{'id': instance.id, 'action': instance.action};
