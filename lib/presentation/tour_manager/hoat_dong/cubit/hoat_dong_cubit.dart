import 'package:booking_tour_flutter/domain/activity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:get_it/get_it.dart';
import 'hoat_dong_state.dart';

class HoatDongCubit extends Cubit<HoatDongState> {
  static final _repository = GetIt.instance<BookingRepository>();

  HoatDongCubit() : super(HoatDongInitial());

  // Lấy danh sách hoạt động
  Future<void> loadActivities() async {
    emit(HoatDongLoading());

    try {
      final result = await _repository.getActivities();

      result.fold(
        (failure) => emit(HoatDongError(message: failure.message)),
        (activities) => emit(HoatDongLoaded(activities: activities)),
      );
    } catch (e) {
      emit(
        HoatDongError(message: 'Có lỗi xảy ra khi tải danh sách hoạt động: $e'),
      );
    }
  }

  // Thêm hoạt động mới
  Future<void> addActivity(String action) async {
    if (state is! HoatDongLoaded) return;

    final currentState = state as HoatDongLoaded;
    emit(currentState.copyWith(isLoading: true));

    try {
      final result = await _repository.postActivity(action);

      result.fold(
        (failure) {
          emit(HoatDongError(message: failure.message));
          emit(currentState.copyWith(isLoading: false));
        },
        (activities) async {
          emit(
            HoatDongSuccess(
              message: 'Thêm hoạt động thành công',
              activities: currentState.activities,
            ),
          );
          await loadActivities();
        },
      );
    } catch (e) {
      emit(HoatDongError(message: 'Có lỗi xảy ra khi thêm hoạt động: $e'));
      emit(currentState.copyWith(isLoading: false));
    }
  }

  // Cập nhật hoạt động
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
      emit(
        currentState.copyWith(
          isLoading: false,
          error: 'Có lỗi xảy ra khi cập nhật hoạt động: $e',
        ),
      );
    }
  }

  // Xóa hoạt động
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

      // Sau khi thành công, load lại danh sách
      await Future.delayed(const Duration(milliseconds: 500));
      await loadActivities();
    } catch (e) {
      emit(
        currentState.copyWith(
          isLoading: false,
          error: 'Có lỗi xảy ra khi xóa hoạt động: $e',
        ),
      );
    }
  }

  // Làm mới danh sách
  Future<void> refreshActivities() async {
    try {
      await loadActivities();
    } catch (e) {
      emit(HoatDongError(message: 'Lỗi khi tải lại danh sách: $e'));
    }
  }

  // Xóa thông báo lỗi
  void clearError() {
    if (state is HoatDongLoaded) {
      final currentState = state as HoatDongLoaded;
      emit(currentState.copyWith(error: null));
    }
  }

  // Xóa thông báo thành công
  void clearSuccess() {
    if (state is HoatDongSuccess) {
      final successState = state as HoatDongSuccess;
      emit(HoatDongLoaded(activities: successState.activities));
    }
  }
}
