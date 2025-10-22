// import 'package:booking_tour_flutter/domain/model/hoat_dong.dart';
// import 'package:equatable/equatable.dart';

// enum DanhSachHoatDongStatus { initial, loading, success, failure }

// class DanhSachHoatDongState extends Equatable {
//   final List<HoatDong> danhSachHoatDong;
//   final DanhSachHoatDongStatus status;
//   final String? error;

//   const DanhSachHoatDongState({
//     this.danhSachHoatDong = const [],
//     this.status = DanhSachHoatDongStatus.initial,
//     this.error,
//   });

//   DanhSachHoatDongState copyWith({
//     List<HoatDong>? danhSachHoatDong,
//     DanhSachHoatDongStatus? status,
//     String? error,
//   }) {
//     return DanhSachHoatDongState(
//       danhSachHoatDong: danhSachHoatDong ?? this.danhSachHoatDong,
//       status: status ?? this.status,
//       error: error ?? this.error,
//     );
//   }

//   @override
//   List<Object?> get props => [danhSachHoatDong, status, error];
// }
