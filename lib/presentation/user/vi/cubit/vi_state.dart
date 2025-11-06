import 'package:booking_tour_flutter/domain/user.dart';

class ViState {
  final User user;

  ViState({
    required this.user
  });

  ViState copyWith({
    User? user
  }){
    return ViState(user: user ?? this.user);
  }
}