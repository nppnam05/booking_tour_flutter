import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/domain/requests/add_place_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'them_hoat_dong_state.dart';

class ThemHoatDongCubit extends Cubit<ThemHoatDongState> {
  ThemHoatDongCubit() : super(const ThemHoatDongState());
  final bookingRepository = GetIt.instance<BookingRepository>();
  Future<void> loadProvinces() async {
    emit(state.copyWith(status: ThemHoatDongStatus.loadingProvinces));
    try {
      final result = await bookingRepository.getProvinces();

      result.fold(
        (failure) => emit(
          state.copyWith(
            status: ThemHoatDongStatus.failure,
            error: failure.message,
          ),
        ),
        (provinces) => emit(
          state.copyWith(
            status: ThemHoatDongStatus.initial,
            provinces: provinces ?? [],
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: ThemHoatDongStatus.failure, error: e.toString()),
      );
    }
  }

  Future<void> themHoatDong(String tenDiaDiem, int tinhThanhId) async {
    emit(state.copyWith(status: ThemHoatDongStatus.loadingAdd));
    try {
      final result = await bookingRepository.addPlace(
        AddPlaceRequest(name: tenDiaDiem, locationId: tinhThanhId),
      );

      result.fold(
        (failure) => emit(
          state.copyWith(
            status: ThemHoatDongStatus.failure,
            error: failure.message,
          ),
        ),
        (place) => emit(state.copyWith(status: ThemHoatDongStatus.success)),
      );
    } catch (e) {
      emit(
        state.copyWith(status: ThemHoatDongStatus.failure, error: e.toString()),
      );
    }
  }
}
