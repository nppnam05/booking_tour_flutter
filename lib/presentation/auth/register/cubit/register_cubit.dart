import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/app/dialog_helper.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/data/request/create_user_request.dart';
import 'package:booking_tour_flutter/presentation/auth/register/cubit/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  static final registerRepository = getIt<BookingRepository>();

  RegisterCubit() : super(RegisterState());

  Future<bool> checkAccount(CreateUserRequest user) async {
    await DialogHelper.showLoadingDialog();
    

    DialogHelper.dismissDialog();

    return true;
  }
}