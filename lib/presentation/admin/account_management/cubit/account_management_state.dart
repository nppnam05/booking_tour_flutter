import 'package:booking_tour_flutter/domain/role.dart';
import 'package:booking_tour_flutter/domain/staff.dart';
import 'package:equatable/equatable.dart';

class AccountManagementState extends Equatable {
  final List<Staff> staffs;
  final List<Role> roles;
  final Staff? selectedStaff;
  final bool loading;
  final String? error;

  const AccountManagementState({
    this.staffs = const [],
    this.roles = const [],
    this.selectedStaff,
    this.loading = false,
    this.error,
  });

  AccountManagementState copyWith({
    List<Staff>? staffs,
    List<Role>? roles,
    Staff? selectedStaff,
    bool? loading,
    String? error,
  }) {
    return AccountManagementState(
      staffs: staffs ?? this.staffs,
      roles: roles ?? this.roles,
      selectedStaff: selectedStaff,
      loading: loading ?? this.loading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [staffs, roles, selectedStaff, loading, error];
}
