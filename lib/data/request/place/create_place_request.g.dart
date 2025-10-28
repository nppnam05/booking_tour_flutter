// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_place_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceResponse _$PlaceResponseFromJson(Map<String, dynamic> json) =>
    PlaceResponse(
      name: json['name'] as String?,
      location:
          json['location'] == null
              ? null
              : ProvinceResponse.fromJson(
                json['location'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$PlaceResponseToJson(PlaceResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'location': instance.location?.toJson(),
    };
