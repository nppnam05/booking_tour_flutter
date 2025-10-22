import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/presentation/auth/auth_otp/cubit/auth_otp_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthOtpCubit extends Cubit<AuthOtpState> {
  static final userRepository = getIt<BookingRepository>();

  AuthOtpCubit() : super(AuthOtpState(posts: []));

  Future<void> syncPost() async {
    var result = await userRepository.getPost();

    result.fold((failure) {}, (posts){
      emit(state.copyWith(posts: posts));
    });
  }
}