import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/presentation/auth/auth_otp_change_password/cubit/auth_otp_change_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthOtpChangePasswordCubit extends Cubit<AuthOtpChangePasswordState> {
  static final userRepository = getIt<BookingRepository>();

  AuthOtpChangePasswordCubit() : super(AuthOtpChangePasswordState(posts: []));

  Future<void> syncPost() async {
    var result = await userRepository.getPost();

    result.fold((failure) {}, (posts){
      emit(state.copyWith(posts: posts));
    });
  }
}