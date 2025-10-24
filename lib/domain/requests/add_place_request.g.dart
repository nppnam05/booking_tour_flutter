// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_place_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddPlaceRequest _$AddPlaceRequestFromJson(Map<String, dynamic> json) =>
    AddPlaceRequest(
      name: json['name'] as String,
      locationId: (json['locationId'] as num).toInt(),
    );

Map<String, dynamic> _$AddPlaceRequestToJson(AddPlaceRequest instance) =>
    <String, dynamic>{'name': instance.name, 'locationId': instance.locationId};
