// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_manager_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripManagerResponse _$TripManagerResponseFromJson(Map<String, dynamic> json) =>
    TripManagerResponse(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      tourImages: json['tourImages'] as List<dynamic>?,
      price: (json['price'] as num?)?.toInt(),
      province:
          json['province'] == null
              ? null
              : ProvinceResponse.fromJson(
                json['province'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$TripManagerResponseToJson(
  TripManagerResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'tourImages': instance.tourImages,
  'price': instance.price,
  'province': instance.province,
};
