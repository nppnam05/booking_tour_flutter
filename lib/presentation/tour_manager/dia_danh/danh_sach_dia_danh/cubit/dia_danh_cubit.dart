import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/domain/province.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/dia_danh/danh_sach_dia_danh/cubit/dia_danh_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiaDanhCubit extends Cubit<DiaDanhState> {
  static final bookingRepository = getIt<BookingRepository>();

  DiaDanhCubit() : super(DiaDanhState(provinces: [], places: []));

  //Dữ liệu ban đầu
  Future<void> syncProvinces() async {
    var result1 = await bookingRepository.getProvinces();
    var result2 = await bookingRepository.getPlaces();

    result1.fold((failure) {}, (province) {
      emit(state.copyWith(province: province));
    });

    result2.fold((failure) {}, (places) {
      emit(state.copyWith(place: places));
    });
  }

  //Reload danh sách địa danh (sau khi sửa)
  Future<void> reloadPlaces() async {
    final result = await bookingRepository.getPlaces();

    result.fold(
      (failure) => print("Lỗi khi reload địa danh: ${failure.message}"),
      (places) => emit(state.copyWith(place: places, filteredPlace: places)),
    );
  }

  //Chọn tỉnh thành
  void selectProvinces(Province? province) async {
    if (province == null) return;
    emit(state.copyWith(selectedProvince: province));

    final result = await bookingRepository.getPlaces(
      provinceIds: [province.id],
    );
    result.fold(
      (failure) {
        print("Lỗi khi lấy địa danh: $failure");
      },
      (places) {
        emit(state.copyWith(place: places, filteredPlace: places));
      },
    );
  }

  // Tìm kiếm
  void filterPlaces(String query) {
    if (query.isEmpty) {
      emit(state.copyWith(filteredPlace: state.places));
      return;
    }
    final filtered =
        state.places
            .where(
              (place) => place.name.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
    emit(state.copyWith(filteredPlace: filtered));
  }

  //Delete
  Future<void> deletePlace(int id) async {
    try {
      await bookingRepository.deletePlace(id: id);
    } catch (e) {
      rethrow;// log lỗi
    }
  }
}
