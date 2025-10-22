// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_activity_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationActivityResponse _$LocationActivityResponseFromJson(
  Map<String, dynamic> json,
) => LocationActivityResponse(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
);

Map<String, dynamic> _$LocationActivityResponseToJson(
  LocationActivityResponse instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};
