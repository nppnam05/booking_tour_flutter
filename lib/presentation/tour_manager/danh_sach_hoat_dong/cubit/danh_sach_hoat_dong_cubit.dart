import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_tour_flutter/domain/model/hoat_dong.dart';
import 'danh_sach_hoat_dong_state.dart';

class DanhSachHoatDongCubit extends Cubit<DanhSachHoatDongState> {
  DanhSachHoatDongCubit() : super(const DanhSachHoatDongState()) {
    getDanhSachHoatDong();
  }

  final List<HoatDong> _data = [
    HoatDong(id: '1', tenDiaDiem: 'Bà Nà Hills', tinhThanh: 'Đà Nẵng'),
    HoatDong(id: '2', tenDiaDiem: 'Phố cổ Hội An', tinhThanh: 'Quảng Nam'),
    HoatDong(id: '3', tenDiaDiem: 'Cầu Rồng', tinhThanh: 'Đà Nẵng'),
  ];

  Future<void> getDanhSachHoatDong() async {
    emit(state.copyWith(status: DanhSachHoatDongStatus.loading));
    try {
      emit(
        state.copyWith(
          status: DanhSachHoatDongStatus.success,
          danhSachHoatDong: _data,
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

  Future<void> themHoatDong(String tenDiaDiem, String tinhThanh) async {
    emit(state.copyWith(status: DanhSachHoatDongStatus.loading));
    try {
      final newHoatDong = HoatDong(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        tenDiaDiem: tenDiaDiem,
        tinhThanh: tinhThanh,
      );
      _data.add(newHoatDong);

      emit(
        state.copyWith(
          status: DanhSachHoatDongStatus.success,
          danhSachHoatDong: List.from(_data),
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

  Future<void> suaHoatDong(
    String id,
    String tenDiaDiem,
    String tinhThanh,
  ) async {
    emit(state.copyWith(status: DanhSachHoatDongStatus.loading));
    try {
      final updatedList =
          state.danhSachHoatDong.map((hoatDong) {
            if (hoatDong.id == id) {
              return HoatDong(
                id: id,
                tenDiaDiem: tenDiaDiem,
                tinhThanh: tinhThanh,
              );
            }
            return hoatDong;
          }).toList();
      emit(
        state.copyWith(
          status: DanhSachHoatDongStatus.success,
          danhSachHoatDong: updatedList,
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
}
