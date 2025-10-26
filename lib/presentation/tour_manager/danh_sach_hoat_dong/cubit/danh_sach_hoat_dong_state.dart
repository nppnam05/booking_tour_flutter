import 'package:booking_tour_flutter/domain/location_activity.dart';
import 'package:booking_tour_flutter/domain/activity.dart';
import 'package:equatable/equatable.dart';

enum DanhSachHoatDongStatus { initial, loading, success, failure }

class DanhSachHoatDongState extends Equatable {
  final List<LocationActivity> danhSachHoatDong;
  final DanhSachHoatDongStatus status;
  final String? error;
  final LocationActivity? selectedLocationActivity;
  final List<Activity> activities;
  final List<Activity> filteredActivities;
  final String searchQuery;

  const DanhSachHoatDongState({
    this.danhSachHoatDong = const [],
    this.status = DanhSachHoatDongStatus.initial,
    this.error,
    this.selectedLocationActivity,
    this.activities = const [],
    this.filteredActivities = const [],
    this.searchQuery = '',
  });

  DanhSachHoatDongState copyWith({
    List<LocationActivity>? danhSachHoatDong,
    DanhSachHoatDongStatus? status,
    String? error,
    LocationActivity? selectedLocationActivity,
    List<Activity>? activities,
    List<Activity>? filteredActivities,
    String? searchQuery,
  }) {
    return DanhSachHoatDongState(
      danhSachHoatDong: danhSachHoatDong ?? this.danhSachHoatDong,
      status: status ?? this.status,
      error: error ?? this.error,
      selectedLocationActivity: selectedLocationActivity ?? this.selectedLocationActivity,
      activities: activities ?? this.activities,
      filteredActivities: filteredActivities ?? this.filteredActivities,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props => [danhSachHoatDong, status, error, selectedLocationActivity, activities, filteredActivities, searchQuery];
}
