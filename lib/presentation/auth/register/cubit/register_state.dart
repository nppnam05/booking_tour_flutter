class RegisterState {
  bool isEmailExist;

  RegisterState({required this.isEmailExist});

  RegisterState copyWith({
    bool? isEmailExist,
  }) {
    return RegisterState(
      isEmailExist: isEmailExist ?? this.isEmailExist,
    );
  }

  coppyWithError() {
    return RegisterState(isEmailExist: false);
  }
}
