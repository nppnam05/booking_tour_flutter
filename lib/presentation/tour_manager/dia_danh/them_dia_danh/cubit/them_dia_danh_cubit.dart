import 'package:booking_tour_flutter/domain/province.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/dia_danh/sua_dia_danh/cubit/sua_dia_danh_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_tour_flutter/domain/place.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';

class ThemDiaDanhCubit extends Cubit<SuaDiaDanhState> {
  final bookingRepository = getIt<BookingRepository>();

  ThemDiaDanhCubit({Place? place})
    : super(SuaDiaDanhState(name: "", province: null, provinces: [])) {
    loadProvinces();
  }

  // load danh sach tinh
  Future<void> loadProvinces() async {
    final result = await bookingRepository.getProvinces();
    result.fold(
      (failure) {
        emit(state.copyWith(error: failure.message));
      },
      (provinces) {
        emit(state.copyWith(provinces: provinces));
      },
    );
  }

  void setName(String name) {
    emit(state.copyWith(name: name));
  }

  void setProvince(Province province) {
    emit(state.copyWith(province: province));
  }

  Future<void> createPlace() async {
    if ((state.name ?? '').isEmpty) {
      emit(state.copyWith(error: "Vui lòng nhập tên địa danh"));
      return;
    }

    if (state.province == null) {
      emit(state.copyWith(error: "Vui lòng chọn tỉnh thành"));
      return;
    }

    emit(state.copyWith(isLoading: true, error: null));

    final result = await bookingRepository.createPlace(
      name: state.name!,
      locationId: state.province!.id,
    );

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, error: failure.message));
      },
      (updatedPlace) {
        emit(
          state.copyWith(
            isLoading: false,
            successMessage: "Thêm thành công",
            name: updatedPlace.name,
            province: updatedPlace.province,
          ),
        );
      },
    );
  }
}
