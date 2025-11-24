import 'package:booking_tour_flutter/domain/role.dart';
import 'package:booking_tour_flutter/domain/user.dart';

class Staff {
  final int userId;
  final String code;
  final bool isActive;
  final String cccd;
  final String address;
  final DateTime dateOfBirth;
  final DateTime startWorkingDate;
  final DateTime cccdIssueDate;
  final String cccD_front_path;
  final String cccD_back_path;
  final DateTime endWorkingDate;

  final User user;
  final Role role;

  Staff({
    required this.userId,
    required this.code,
    required this.isActive,
    required this.cccd,
    required this.address,
    required this.dateOfBirth,
    required this.startWorkingDate,
    required this.cccdIssueDate,
    required this.cccD_front_path,
    required this.cccD_back_path,
    required this.endWorkingDate,
    required this.user,
    required this.role,
  });

  static Staff empty() {
    return Staff(
      userId: 0,
      code: '',
      isActive: false,
      cccd: '',
      address: '',
      dateOfBirth: DateTime.now(),
      startWorkingDate: DateTime.now(),
      cccdIssueDate: DateTime.now(),
      cccD_front_path: '',
      cccD_back_path: '',
      endWorkingDate: DateTime.now(),
      user: User.empty(),
      role: Role.empty(),
    );
  }
}
