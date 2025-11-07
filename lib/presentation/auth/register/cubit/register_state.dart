class RegisterState {
  bool isEmailValid;
  bool isPasswordValid;
  bool checkSendOTP;


  RegisterState({
    required this.isEmailValid,
    required this.isPasswordValid,
    required this.checkSendOTP
  });
  
  RegisterState copyWith({
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? checkSendOTP
  }) {
    return RegisterState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      checkSendOTP: checkSendOTP ?? this.checkSendOTP
    );
  }

  coppyWithError() {
    return RegisterState(isEmailValid: false, isPasswordValid: false, checkSendOTP: false);
  }
}
