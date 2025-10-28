// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCompletedScheduleResponse _$UserCompletedScheduleResponseFromJson(
  Map<String, dynamic> json,
) => UserCompletedScheduleResponse(
  startDate: json['startDate'] as String?,
  endDate: json['endDate'] as String?,
  code: json['code'] as String?,
  name: json['name'] as String?,
  avatarPath: json['avatarPath'] as String?,
  booking:
      (json['booking'] as List<dynamic>?)
          ?.map((e) => BookingResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$UserCompletedScheduleResponseToJson(
  UserCompletedScheduleResponse instance,
) => <String, dynamic>{
  'startDate': instance.startDate,
  'endDate': instance.endDate,
  'code': instance.code,
  'name': instance.name,
  'avatarPath': instance.avatarPath,
  'booking': instance.booking,
};

BookingResponse _$BookingResponseFromJson(Map<String, dynamic> json) =>
    BookingResponse(
      userId: (json['userId'] as num?)?.toInt(),
      numPeople: (json['numPeople'] as num?)?.toInt(),
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$BookingResponseToJson(BookingResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'numPeople': instance.numPeople,
      'phone': instance.phone,
    };
