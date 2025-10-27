import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/domain/user.dart';
import 'package:booking_tour_flutter/presentation/auth/login/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  static final userRepository = getIt<BookingRepository>();

  LoginCubit() : super(LoginState(user: User.empty()));
  
  Future<void> syncPost(String email, String password) async {
    var result = await userRepository.postLogin(email: email, password: password);

    result.fold((failure) {
      emit(state.copyWithError());
    }, (user){
      emit(state.copyWith(user: user));
    });
  }
}