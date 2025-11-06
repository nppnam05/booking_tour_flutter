import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/domain/user.dart';
import 'package:booking_tour_flutter/presentation/user/vi/cubit/vi_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViCubit extends Cubit<ViState> {
  final bookingRepository = getIt<BookingRepository>();
  ViCubit() : super(ViState(user: User.empty()));

  // load data
  Future<void> syncUser(int id) async {
    var result = await bookingRepository.getUserById(id: id);

    result.fold(
      (failure) {
        print('Lỗi: ${failure.message}');
      },
      (user) {
        emit(state.copyWith(user: user));
      },
    );
  }

  void updateLocalFeild(String label, String newValue) {
    final user = state.user;

    final updateUser = User(
      id: user.id,
      roleId: user.roleId,
      money: user.money,
      bankNumber: label == "Số tài khoản ngân hàng" ? newValue :  user.bankNumber,
      bank: label == "Tên ngân hàng" ? newValue : user.bank,
      name: user.name,
      email: user.email,
      phone: user.phone,
      avatarPath: user.avatarPath,
      bankBranch: label == "Chi nhánh ngân hàng" ? newValue :  user.bankBranch,
    );
    emit(state.copyWith(user: updateUser));
  }

  Future<void> saveChangeUpdate() async {
    var user = state.user;
    final result = await bookingRepository.updateUserId(
      id: user.id,
      name: user.name,
      email: user.email,
      phone: user.phone,
      bank: user.bank,
      avatarPath: user.avatarPath,
      bankBranch: user.bankBranch,
      bankNumber: user.bankNumber
    );

    result.fold((failure){
      print("faild");
    }, (user){
      emit(state.copyWith(user: user));
    });
  }
}