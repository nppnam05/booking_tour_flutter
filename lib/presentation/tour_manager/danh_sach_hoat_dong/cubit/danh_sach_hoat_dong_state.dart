import 'package:booking_tour_flutter/domain/location_activity.dart';
import 'package:equatable/equatable.dart';

enum DanhSachHoatDongStatus { initial, loading, success, failure }

class DanhSachHoatDongState extends Equatable {
  final List<LocationActivity> danhSachHoatDong;
  final DanhSachHoatDongStatus status;
  final String? error;
  final LocationActivity? selectedLocationActivity;

  const DanhSachHoatDongState({
    this.danhSachHoatDong = const [],
    this.status = DanhSachHoatDongStatus.initial,
    this.error,
    this.selectedLocationActivity,
  });

  DanhSachHoatDongState copyWith({
    List<LocationActivity>? danhSachHoatDong,
    DanhSachHoatDongStatus? status,
    String? error,
    LocationActivity? selectedLocationActivity,
  }) {
    return DanhSachHoatDongState(
      danhSachHoatDong: danhSachHoatDong ?? this.danhSachHoatDong,
      status: status ?? this.status,
      error: error ?? this.error,
      selectedLocationActivity: selectedLocationActivity ?? this.selectedLocationActivity,
    );
  }

  @override
  List<Object?> get props => [danhSachHoatDong, status, error, selectedLocationActivity];
}
