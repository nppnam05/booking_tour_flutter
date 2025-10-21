// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceResponse _$PlaceResponseFromJson(Map<String, dynamic> json) =>
    PlaceResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      province:
          json['province'] == null
              ? null
              : ProvinceResponse.fromJson(
                json['province'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$PlaceResponseToJson(PlaceResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'province': instance.province,
    };
