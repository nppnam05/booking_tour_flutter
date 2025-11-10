// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewResponse _$ReviewResponseFromJson(Map<String, dynamic> json) =>
    ReviewResponse(
      rating: (json['rating'] as num?)?.toInt(),
      content: json['content'] as String?,
      createdAt:
          json['createdAt'] == null
              ? null
              : DateTime.parse(json['createdAt'] as String),
      user:
          json['user'] == null
              ? null
              : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      guide:
          (json['guide'] as List<dynamic>?)
              ?.map((e) => GuideResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
      booking:
          json['booking'] == null
              ? null
              : BookingResponse.fromJson(
                json['booking'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$ReviewResponseToJson(ReviewResponse instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'content': instance.content,
      'createdAt': instance.createdAt?.toIso8601String(),
      'user': instance.user,
      'guide': instance.guide,
      'booking': instance.booking,
    };
