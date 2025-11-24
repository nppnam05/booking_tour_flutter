import 'package:flutter/foundation.dart';

@immutable
class CreateStaffAccountPart2State {
  final String? frontPath;
  final String? backPath;
  final bool submitting;
  final String? errorMessage;

  const CreateStaffAccountPart2State({
    this.frontPath,
    this.backPath,
    this.submitting = false,
    this.errorMessage,
  });

  CreateStaffAccountPart2State copyWith({
    String? frontPath,
    String? backPath,
    bool? submitting,
    String? errorMessage,
  }) {
    return CreateStaffAccountPart2State(
      frontPath: frontPath ?? this.frontPath,
      backPath: backPath ?? this.backPath,
      submitting: submitting ?? this.submitting,
      errorMessage: errorMessage,
    );
  }
}

