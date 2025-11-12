class ForgetState {
  final bool checkEmail;
  final bool existedEmail;
  final String email;
  ForgetState({
    required this.checkEmail,
    required this.existedEmail,
    required this.email
  });

  ForgetState copyWith({bool? checkEmail,bool? existedEmail, String? email}){
    return ForgetState(checkEmail: checkEmail ?? this.checkEmail,existedEmail: existedEmail ?? this.existedEmail, email: email ?? this.email);
  }
}
