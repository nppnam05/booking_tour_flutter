// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewResponse _$ReviewResponseFromJson(Map<String, dynamic> json) =>
    ReviewResponse(
      id: (json['id'] as num?)?.toInt(),
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
          json['guide'] == null
              ? null
              : GuideResponse.fromJson(json['guide'] as Map<String, dynamic>),
      booking:
          json['booking'] == null
              ? null
              : BookingResponse.fromJson(
                json['booking'] as Map<String, dynamic>,
              ),
      isHelpful: json['isHelpful'] as bool?,
    );

Map<String, dynamic> _$ReviewResponseToJson(ReviewResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rating': instance.rating,
      'content': instance.content,
      'createdAt': instance.createdAt?.toIso8601String(),
      'user': instance.user,
      'guide': instance.guide,
      'booking': instance.booking,
      'isHelpful': instance.isHelpful,
    };
