// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_location_activity_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddLocationActivityResponse _$AddLocationActivityResponseFromJson(
  Map<String, dynamic> json,
) => AddLocationActivityResponse(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  place:
      json['place'] == null
          ? null
          : PlaceActivityResponse.fromJson(
            json['place'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$AddLocationActivityResponseToJson(
  AddLocationActivityResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'place': instance.place,
};

PlaceActivityResponse _$PlaceActivityResponseFromJson(
  Map<String, dynamic> json,
) => PlaceActivityResponse(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  location:
      json['location'] == null
          ? null
          : LocationResponse.fromJson(json['location'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PlaceActivityResponseToJson(
  PlaceActivityResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'location': instance.location,
};

LocationResponse _$LocationResponseFromJson(Map<String, dynamic> json) =>
    LocationResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$LocationResponseToJson(LocationResponse instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
