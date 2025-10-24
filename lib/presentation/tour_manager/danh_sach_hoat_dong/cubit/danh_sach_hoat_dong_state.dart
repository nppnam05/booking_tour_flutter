import 'package:booking_tour_flutter/domain/place.dart';
import 'package:equatable/equatable.dart';

enum DanhSachHoatDongStatus { initial, loading, success, failure }

class DanhSachHoatDongState extends Equatable {
  final List<Place> danhSachHoatDong;
  final DanhSachHoatDongStatus status;
  final String? error;
  final Place? selectedPlace;

  const DanhSachHoatDongState({
    this.danhSachHoatDong = const [],
    this.status = DanhSachHoatDongStatus.initial,
    this.error,
    this.selectedPlace,
  });

  DanhSachHoatDongState copyWith({
    List<Place>? danhSachHoatDong,
    DanhSachHoatDongStatus? status,
    String? error,
    Place? selectedPlace,
  }) {
    return DanhSachHoatDongState(
      danhSachHoatDong: danhSachHoatDong ?? this.danhSachHoatDong,
      status: status ?? this.status,
      error: error ?? this.error,
      selectedPlace: selectedPlace ?? this.selectedPlace,
    );
  }

  @override
  List<Object?> get props => [danhSachHoatDong, status, error, selectedPlace];
}
