import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/app/dialog_helper.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/domain/user.dart';
import 'package:booking_tour_flutter/presentation/auth/login/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginCubit extends Cubit<LoginState> {
  static final userRepository = getIt<BookingRepository>();
  final GoogleSignIn googleSignIn;

  LoginCubit({GoogleSignIn? googleSignIn}) 
      : googleSignIn = googleSignIn ?? GoogleSignIn(),
        super(LoginState(user: User.empty()));
  
  Future<void> login(String email, String password) async {
    await DialogHelper.showLoadingDialog();

    var result = await userRepository.postLogin(email: email, password: password);

    result.fold((failure) {
      emit(state.copyWithError());
    }, (user){
      emit(state.copyWith(user: user));
    });

    DialogHelper.dismissDialog();
  }

  Future<void> signInWithGoogle() async {

    try {
      await googleSignIn.signOut();

      // Đăng nhập Google
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      // User hủy đăng nhập
      if (googleUser == null) {
        DialogHelper.dismissDialog();
        return;
      }

      await DialogHelper.showLoadingDialog();

      //Lấy thông tin user từ Google
      final String email = googleUser.email;
      final String name = googleUser.displayName ?? '';
      final String photoUrl = googleUser.photoUrl ?? '';
      final String password = googleUser.serverAuthCode ?? "";

      
      var result = await userRepository.loginByEmail(
        email: email,
        name: name,
        photoUrl: photoUrl,
        password: password,
      );

      result.fold((failure) {
        emit(state.copyWithError());
      }, (user){
        emit(state.copyWith(user: user));
      });

      DialogHelper.dismissDialog();

    } catch (error) {
      emit(state.copyWithError());
    }

  }
}