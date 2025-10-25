// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignmentResponse _$AssignmentResponseFromJson(Map<String, dynamic> json) =>
    AssignmentResponse(
      idSchedule: (json['idSchedule'] as num?)?.toInt(),
      titleTour: json['titleTour'] as String?,
      tourImageDTOs:
          (json['tourImageDTOs'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      nameLocations:
          (json['nameLocations'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      placeNameDTOs:
          (json['placeNameDTOs'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
    );

Map<String, dynamic> _$AssignmentResponseToJson(AssignmentResponse instance) =>
    <String, dynamic>{
      'idSchedule': instance.idSchedule,
      'titleTour': instance.titleTour,
      'tourImageDTOs': instance.tourImageDTOs,
      'nameLocations': instance.nameLocations,
      'placeNameDTOs': instance.placeNameDTOs,
    };
