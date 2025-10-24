import 'package:booking_tour_flutter/domain/province.dart';
import 'package:equatable/equatable.dart';

enum ThemHoatDongStatus { initial, loadingProvinces, loadingAdd, success, failure }

class ThemHoatDongState extends Equatable {
  final ThemHoatDongStatus status;
  final String? error;
  final List<Province> provinces;

  const ThemHoatDongState({
    this.status = ThemHoatDongStatus.initial,
    this.error,
    this.provinces = const [],
  });

  ThemHoatDongState copyWith({
    ThemHoatDongStatus? status,
    String? error,
    List<Province>? provinces,
  }) {
    return ThemHoatDongState(
      status: status ?? this.status,
      error: error ?? this.error,
      provinces: provinces ?? this.provinces,
    );
  }

  @override
  List<Object?> get props => [status, error, provinces];
}
