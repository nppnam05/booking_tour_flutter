import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/domain/user.dart';
import 'package:booking_tour_flutter/presentation/user/thong_tin_cua_ban/cubit/thong_tin_cua_ban_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThongTinCuaBanCubit extends Cubit<ThongTinCuaBanState> {
  final bookingRepository = getIt<BookingRepository>();

  ThongTinCuaBanCubit() : super(ThongTinCuaBanState(user: User.empty()));

  Future<void> syncUser(int id) async{
    var result = await bookingRepository.getUserById(id: id);
    
    result.fold(
      (failure){
        print('Lỗi: ${failure.message}');
      },
      (user){
        print("hiihi" + user.name);
        emit(state.copyWith(user: user));
      });
  }
}