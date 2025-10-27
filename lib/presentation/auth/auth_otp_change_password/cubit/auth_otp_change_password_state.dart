import 'package:booking_tour_flutter/domain/fake_post.dart';

class AuthOtpChangePasswordState {
  final List<FakePost> posts;

  AuthOtpChangePasswordState({required this.posts});

  AuthOtpChangePasswordState copyWith({List<FakePost>? posts}){
    return AuthOtpChangePasswordState(posts: posts ?? this.posts);
  }
}