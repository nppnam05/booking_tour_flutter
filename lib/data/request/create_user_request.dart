import 'package:json_annotation/json_annotation.dart';

part 'create_user_request.g.dart';

@JsonSerializable()
class CreateUserRequest {
  int roleId = 1;
  int money;
  String bankNumber = " ";
  String bank = " ";
  String name;
  String email;
  String phone;
  String avatarPath = " ";
  String bankBranch = " ";

  CreateUserRequest({
    required this.roleId,
    required this.money,
    required this.bankNumber,
    required this.bank,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatarPath,
    required this.bankBranch,
  });

  factory CreateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserRequestToJson(this);
}
