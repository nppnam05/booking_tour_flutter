import 'package:booking_tour_flutter/domain/place.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'danh_sach_hoat_dong_state.dart';

class DanhSachHoatDongCubit extends Cubit<DanhSachHoatDongState> {
  DanhSachHoatDongCubit() : super(const DanhSachHoatDongState()) {
    getDanhSachHoatDong();
  }

  Future<void> getDanhSachHoatDong() async {
    emit(state.copyWith(status: DanhSachHoatDongStatus.loading));
    try {
      final bookingRepository = GetIt.instance<BookingRepository>();
      final result = await bookingRepository.getPlaces();
      result.fold(
        (failure) => emit(
          state.copyWith(
            status: DanhSachHoatDongStatus.failure,
            error: failure.message,
          ),
        ),
        (places) => emit(
          state.copyWith(
            status: DanhSachHoatDongStatus.success,
            danhSachHoatDong: places,
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: DanhSachHoatDongStatus.failure,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> suaHoatDong(String tenDiaDiem, String tinhThanh) async {
    emit(state.copyWith(status: DanhSachHoatDongStatus.loading));
    try {
      final selectedPlace = state.selectedPlace;
      if (selectedPlace == null) {
        emit(
          state.copyWith(
            status: DanhSachHoatDongStatus.failure,
            error: 'Không tìm thấy dữ liệu để chỉnh sửa',
          ),
        );
        return;
      }

      // TODO: Implement API call to update place
      await getDanhSachHoatDong();
    } catch (e) {
      emit(
        state.copyWith(
          status: DanhSachHoatDongStatus.failure,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> xoaHoatDong() async {
    emit(state.copyWith(status: DanhSachHoatDongStatus.loading));
    try {
      final selectedPlace = state.selectedPlace;
      if (selectedPlace == null) {
        emit(
          state.copyWith(
            status: DanhSachHoatDongStatus.failure,
            error: 'Không tìm thấy dữ liệu để xóa',
          ),
        );
        return;
      }

      // TODO: Implement API call to delete place
      await getDanhSachHoatDong();
    } catch (e) {
      emit(
        state.copyWith(
          status: DanhSachHoatDongStatus.failure,
          error: e.toString(),
        ),
      );
    }
  }

  void setPlaceSelected(Place place) {
    emit(state.copyWith(selectedPlace: place));
  }

  void clearPlaceSelected() {
    emit(state.copyWith(selectedPlace: null));
  }
}
