import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/presentation/auth/register/cubit/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  static final userRepository = getIt<BookingRepository>();

  RegisterCubit() : super(RegisterState(posts: []));

  Future<void> syncPost() async {
    var result = await userRepository.getPost();

    result.fold((faulure) {}, (posts) {
      emit(state.copyWith(posts: posts));
    });
  }
}