import 'package:booking_tour_flutter/data/response/role_response.dart';
import 'package:booking_tour_flutter/data/response/user_response.dart';
import 'package:booking_tour_flutter/domain/role.dart';
import 'package:booking_tour_flutter/domain/staff.dart';
import 'package:booking_tour_flutter/domain/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'staff_response.g.dart';

@JsonSerializable()
class StaffResponse {
  int? userId;
  String? code;
  bool? isActive;
  String? cccd;
  String? address;
  String? dateOfBirth;
  String? startWorkingDate;
  String? cccdIssueDate;
  String? cccdFrontPath;
  String? cccBackPath;
  String? endWorkingDate;
  
  UserResponse? user;
  RoleResponse? role;

  StaffResponse({
    this.userId,
    this.code,
    this.isActive,
    this.cccd,
    this.address,
    this.dateOfBirth,
    this.startWorkingDate,
    this.cccdIssueDate,
    this.cccdFrontPath,
    this.cccBackPath,
    this.endWorkingDate,
    this.user,
    this.role
  });

  factory StaffResponse.fromJson(Map<String, dynamic> json) =>
      _$StaffResponseFromJson(json);
}

extension StaffResponseMapper on StaffResponse {
  Staff map() {
    return Staff(
      userId: userId ?? 0,
      code: code ?? "",
      isActive: isActive ?? false,
      cccd: cccd ?? "",
      address: address ?? "",
      dateOfBirth: DateTime.tryParse(dateOfBirth ?? "") ?? DateTime.now(),
      startWorkingDate: DateTime.tryParse(startWorkingDate ?? "") ?? DateTime.now(),
      cccdIssueDate: DateTime.tryParse(cccdIssueDate ?? "") ?? DateTime.now(),
      cccdFrontPath: cccdFrontPath ?? "",
      cccBackPath: cccBackPath ?? "",
      endWorkingDate: DateTime.tryParse(endWorkingDate ?? "") ?? DateTime.now(),
      user: user?.map() ?? User.empty(),
      role: role?.map() ?? Role.empty()
    );
  }
}