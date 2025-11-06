import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/app/dialog_helper.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/data/request/check_account_request.dart';
import 'package:booking_tour_flutter/data/request/create_user_request.dart';
import 'package:booking_tour_flutter/presentation/auth/register/cubit/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  static final registerRepository = getIt<BookingRepository>();

  RegisterCubit() : super(RegisterState(isEmailValid: false, isPasswordValid: false));

  Future<void> checkAccount(String email, String password) async {
    await DialogHelper.showLoadingDialog();
    
    var resualt = await registerRepository.checkAccount(checkAccount: CheckAccountRequest(email: email, password: password));

    resualt.fold((left){
      emit(state.coppyWithError());
    }, (checkes){
      emit(state.copyWith(isEmailValid: checkes[0], isPasswordValid: checkes[1]));
    });

    DialogHelper.dismissDialog();
  }

  
}