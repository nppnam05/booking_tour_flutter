import 'package:json_annotation/json_annotation.dart';

part 'create_user_request.g.dart';

@JsonSerializable()
class CreateUserRequest {
  int roleId = 1;
  String password;
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
    required this.password,
    required this.money,
    required this.bankNumber,
    required this.bank,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatarPath,
    required this.bankBranch,
  });

  static empty(){
    return CreateUserRequest(
      roleId: 1,
      password: "",
      money: 0,
      bankNumber: "",
      bank: "",
      name: "",
      email: "",
      phone: "",
      avatarPath: "",
      bankBranch: "",
    );
  }

  factory CreateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserRequestToJson(this);
}
