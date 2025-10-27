// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guide_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuideResponse _$GuideResponseFromJson(Map<String, dynamic> json) =>
    GuideResponse(
      staffId: (json['staffId'] as num).toInt(),
      scheduleId: (json['scheduleId'] as num).toInt(),
    );

Map<String, dynamic> _$GuideResponseToJson(GuideResponse instance) =>
    <String, dynamic>{
      'staffId': instance.staffId,
      'scheduleId': instance.scheduleId,
    };
