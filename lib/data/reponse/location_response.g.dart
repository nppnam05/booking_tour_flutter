// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationListResponse _$LocationListResponseFromJson(
  Map<String, dynamic> json,
) => LocationListResponse(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => LocationResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$LocationListResponseToJson(
  LocationListResponse instance,
) => <String, dynamic>{'data': instance.data};

LocationResponse _$LocationResponseFromJson(Map<String, dynamic> json) =>
    LocationResponse(
      locationId: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$LocationResponseToJson(LocationResponse instance) =>
    <String, dynamic>{'id': instance.locationId, 'name': instance.name};
