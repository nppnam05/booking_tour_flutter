import 'package:json_annotation/json_annotation.dart';

part 'check_account_request.g.dart';

@JsonSerializable()
class CheckAccountRequest {
  String email;
  String password;

  CheckAccountRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$CheckAccountRequestToJson(this);
}
