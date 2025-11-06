import 'package:booking_tour_flutter/domain/fake_post.dart';

class RegisterState {
  bool isEmailValid;
  bool isPasswordValid;

  RegisterState({
    required this.isEmailValid,
    required this.isPasswordValid,
  });
  
  RegisterState copyWith({
    bool? isEmailValid,
    bool? isPasswordValid,
  }) {
    return RegisterState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
    );
  }

  coppyWithError() {
    return RegisterState(isEmailValid: false, isPasswordValid: false);
  }
}
