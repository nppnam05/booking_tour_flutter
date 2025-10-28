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
  final String cccdFrontPath;
  final String cccBackPath;
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
    required this.cccdFrontPath ,
    required this.cccBackPath,
    required this.endWorkingDate,
    required this.user,
    required this.role
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
      cccdFrontPath: '',
      cccBackPath: '',
      endWorkingDate: DateTime.now(),
      user: User.empty(),
      role: Role.empty()
    );
  }
}
