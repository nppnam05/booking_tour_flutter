// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_location_activity_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddLocationActivityRequest _$AddLocationActivityRequestFromJson(
  Map<String, dynamic> json,
) => AddLocationActivityRequest(
  name: json['name'] as String,
  placeId: (json['placeId'] as num).toInt(),
  activityIds:
      (json['activityIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
);

Map<String, dynamic> _$AddLocationActivityRequestToJson(
  AddLocationActivityRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'placeId': instance.placeId,
  'activityIds': instance.activityIds,
};
