// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserRequest _$CreateUserRequestFromJson(Map<String, dynamic> json) =>
    CreateUserRequest(
      roleId: (json['roleId'] as num).toInt(),
      money: (json['money'] as num).toInt(),
      bankNumber: json['bankNumber'] as String,
      bank: json['bank'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      avatarPath: json['avatarPath'] as String,
      bankBranch: json['bankBranch'] as String,
    );

Map<String, dynamic> _$CreateUserRequestToJson(CreateUserRequest instance) =>
    <String, dynamic>{
      'roleId': instance.roleId,
      'money': instance.money,
      'bankNumber': instance.bankNumber,
      'bank': instance.bank,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'avatarPath': instance.avatarPath,
      'bankBranch': instance.bankBranch,
    };
