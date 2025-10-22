import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/models/activity.dart';
import 'hoat_dong_state.dart';

class HoatDongCubit extends Cubit<HoatDongState> {
  final BookingRepository _repository;

  HoatDongCubit(this._repository) : super(HoatDongInitial());

  // Lấy danh sách hoạt động
  Future<void> loadActivities() async {
    emit(HoatDongLoading());

    final result = await _repository.getActivities();

    result.fold(
      (failure) => emit(HoatDongError(message: failure.message)),
      (activities) => emit(HoatDongLoaded(activities: activities)),
    );
  }

  Future<void> addActivity(String action) async {
    if (state is! HoatDongLoaded) return;

    final currentState = state as HoatDongLoaded;
    emit(currentState.copyWith(isLoading: true, error: null));

    try {
      // TODO: Thêm API call để tạo activity mới
      // Hiện tại chỉ thêm vào danh sách local
      final newActivity = Activity(
        id: DateTime.now().millisecondsSinceEpoch, // Temporary ID
        action: action,
      );

      final updatedActivities = [...currentState.activities, newActivity];
      emit(
        HoatDongSuccess(
          message: 'Thêm hoạt động thành công',
          activities: updatedActivities,
        ),
      );

      await Future.delayed(const Duration(milliseconds: 500));
      await loadActivities();
    } catch (e) {
      emit(currentState.copyWith(isLoading: false));
    }
  }

  Future<void> updateActivity(int activityId, String newAction) async {
    if (state is! HoatDongLoaded) return;

    final currentState = state as HoatDongLoaded;
    emit(currentState.copyWith(isLoading: true, error: null));

    try {
      // TODO: Thêm API call để cập nhật activity
      // Hiện tại chỉ cập nhật danh sách local
      final updatedActivities =
          currentState.activities.map((activity) {
            if (activity.id == activityId) {
              return Activity(id: activity.id, action: newAction);
            }
            return activity;
          }).toList();

      emit(
        HoatDongSuccess(
          message: 'Cập nhật hoạt động thành công',
          activities: updatedActivities,
        ),
      );

      await Future.delayed(const Duration(milliseconds: 500));
      await loadActivities();
    } catch (e) {
      emit(currentState.copyWith(isLoading: false));
    }
  }

  Future<void> deleteActivity(int activityId) async {
    if (state is! HoatDongLoaded) return;

    final currentState = state as HoatDongLoaded;
    emit(currentState.copyWith(isLoading: true, error: null));

    try {
      // TODO: Thêm API call để xóa activity
      // Hiện tại chỉ xóa khỏi danh sách local
      final updatedActivities =
          currentState.activities
              .where((activity) => activity.id != activityId)
              .toList();

      emit(
        HoatDongSuccess(
          message: 'Xóa hoạt động thành công',
          activities: updatedActivities,
        ),
      );
      await Future.delayed(const Duration(milliseconds: 500));
      await loadActivities();
    } catch (e) {
      emit(currentState.copyWith(isLoading: false));
    }
  }

  Future<void> refreshActivities() async {
    await loadActivities();
  }

  void clearError() {
    if (state is HoatDongLoaded) {
      final currentState = state as HoatDongLoaded;
      emit(currentState.copyWith(error: null));
    }
  }

  void clearSuccess() {
    if (state is HoatDongSuccess) {
      final successState = state as HoatDongSuccess;
      emit(HoatDongLoaded(activities: successState.activities));
    }
  }
}
