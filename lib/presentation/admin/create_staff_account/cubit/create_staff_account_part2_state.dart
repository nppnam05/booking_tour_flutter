import 'package:flutter/foundation.dart';

@immutable
class CreateStaffAccountPart2State {
  final String? frontPath;
  final String? backPath;
  final bool submitting;

  const CreateStaffAccountPart2State({
    this.frontPath,
    this.backPath,
    this.submitting = false,
  });

  CreateStaffAccountPart2State copyWith({
    String? frontPath,
    String? backPath,
    bool? submitting,
  }) {
    return CreateStaffAccountPart2State(
      frontPath: frontPath ?? this.frontPath,
      backPath: backPath ?? this.backPath,
      submitting: submitting ?? this.submitting,
    );
  }
}
