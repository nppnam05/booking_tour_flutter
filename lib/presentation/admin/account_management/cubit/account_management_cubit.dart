import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/domain/role.dart';
import 'package:booking_tour_flutter/domain/staff.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'account_management_state.dart';

class AccountManagementCubit extends Cubit<AccountManagementState> {
  final BookingRepository _repo;

  AccountManagementCubit({BookingRepository? repository})
    : _repo = repository ?? getIt<BookingRepository>(),
      super(const AccountManagementState());
  Future<void> loadAll() async {
    emit(state.copyWith(loading: true, error: null));
    final staffRes = await _repo.getAllStaff(0);
    final roleRes = await _repo.getAllRole();

    List<Staff> staffs = [];
    List<Role> roles = [];
    String? error;

    staffRes.fold(
      (failure) => error = failure.message,
      (result) => staffs = result,
    );

    roleRes.fold(
      (failure) => error = failure.message,
      (result) => roles = result,
    );

    emit(
      state.copyWith(
        loading: false,
        staffs: staffs,
        roles: roles,
        error: error,
      ),
    );
  }

  Future<void> loadStaffsByRole(int roleId) async {
    emit(state.copyWith(loading: true, error: null));

    final staffRes = await _repo.getAllStaff(roleId);

    List<Staff> staffs = [];
    String? error;

    staffRes.fold(
      (failure) => error = failure.message,
      (result) => staffs = result,
    );

    emit(state.copyWith(loading: false, staffs: staffs, error: error));
  }

  void setSelectedStaff(Staff staff) {
    emit(state.copyWith(selectedStaff: staff));
  }

  void clearSelectedStaff() {
    emit(state.copyWith(selectedStaff: null));
  }

  Future<bool> deleteStaff(int id) async {
    emit(state.copyWith(loading: true, error: null));

    final res = await _repo.deleteStaff(id);

    bool success = false;
    String? error;

    res.fold(
      (failure) {
        error = failure.message;
        success = false;
      },
      (_) {
        success = true;
      },
    );

    emit(state.copyWith(loading: false, error: error));

    if (success) {
      await loadAll();
    }

    return success;
  }
}
