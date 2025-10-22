import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/presentation/auth/forget_password/cubit/forget_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetCubit extends Cubit<ForgetState> {
  static final userRepository = getIt<BookingRepository>();

  ForgetCubit() : super(ForgetState(posts: []));

  Future<void> syncPost() async {
    var result = await userRepository.getPost();

    result.fold((faulure) {}, (posts) {
      emit(state.copyWith(posts: posts));
    });
  }
}