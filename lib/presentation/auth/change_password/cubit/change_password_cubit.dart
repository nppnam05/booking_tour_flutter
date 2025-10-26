import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/presentation/auth/change_password/cubit/change_password_sate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordSate> {
  static final userRepository = getIt<BookingRepository>();

  ChangePasswordCubit() : super(ChangePasswordSate(posts: []));

  Future<void> syncPost() async{
    var result = await userRepository.getPost();

    result.fold((failure) {}, (posts) {
      emit(state.copyWith(posts: posts));
    });
  } 
}