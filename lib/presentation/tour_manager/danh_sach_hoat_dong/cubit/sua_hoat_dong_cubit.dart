import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/domain/activity.dart';
import 'package:booking_tour_flutter/domain/requests/add_location_activity_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'sua_hoat_dong_state.dart';

class SuaHoatDongCubit extends Cubit<SuaHoatDongState> {
  SuaHoatDongCubit() : super(const SuaHoatDongState());
  final bookingRepository = GetIt.instance<BookingRepository>();

  Future<void> loadActivities({int? locationActivityId, List<Activity>? initialSelectedActivities}) async {
    if (isClosed) return;
    try {
      // Luôn luôn load TẤT CẢ activities
      final allActivitiesResult = await bookingRepository.getActivities();
      
      if (isClosed) return;

      allActivitiesResult.fold(
        (failure) => emit(state.copyWith(activities: [])),
        (allActivities) {
          // Nếu có initial selected activities, dùng nó luôn
          final selected = initialSelectedActivities ?? [];
          
          emit(
            state.copyWith(
              activities: allActivities,
              filteredActivities: allActivities,
              selectedActivities: selected,
            ),
          );
        },
      );
    } catch (e) {
      if (isClosed) return;
      emit(state.copyWith(activities: []));
    }
  }

  void setSelectedActivities(List<Activity> activities) {
    emit(state.copyWith(selectedActivities: activities));
  }

  Future<void> suaHoatDong(
    String name,
    int placeId,
    List<Activity> selectedActivities,
  ) async {
    if (isClosed) return;
    try {
      final activityIds =
          selectedActivities.map((activity) => activity.id).toList();

      final result = await bookingRepository.addLocationActivities(
        AddLocationActivityRequest(
          name: name,
          placeId: placeId,
          activityIds: activityIds,
        ),
      );

      if (isClosed) return;
      result.fold(
        (failure) => emit(state.copyWith(error: failure.message)),
        (locationActivity) => emit(state.copyWith(status: true)),
      );
    } catch (e) {
      if (isClosed) return;
      emit(state.copyWith(error: e.toString()));
    }
  }

  void searchActivities(String query) {
    // Lấy từ toàn bộ activities, không phải từ filteredActivities
    final allActivities = state.activities;
    
    if (query.isEmpty) {
      emit(
        state.copyWith(
          searchQuery: query,
          filteredActivities: allActivities,
        ),
      );
    } else {
      final filtered = allActivities
          .where(
            (activity) =>
                activity.action.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();

      emit(state.copyWith(searchQuery: query, filteredActivities: filtered));
    }
  }

  void clearSearch() {
    emit(state.copyWith(searchQuery: '', filteredActivities: state.activities));
  }
}
