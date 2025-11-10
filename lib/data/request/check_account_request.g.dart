// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckAccountRequest _$CheckAccountRequestFromJson(Map<String, dynamic> json) =>
    CheckAccountRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$CheckAccountRequestToJson(
  CheckAccountRequest instance,
) => <String, dynamic>{'email': instance.email, 'password': instance.password};
