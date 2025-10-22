// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) => Activity(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => ActivityItem.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
  'items': instance.items,
};

ActivityItem _$ActivityItemFromJson(Map<String, dynamic> json) => ActivityItem(
  id: (json['id'] as num).toInt(),
  action: json['action'] as String,
);

Map<String, dynamic> _$ActivityItemToJson(ActivityItem instance) =>
    <String, dynamic>{'id': instance.id, 'action': instance.action};
