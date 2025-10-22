import 'package:booking_tour_flutter/domain/fake_post.dart';

class AuthOtpState {
  final List<FakePost> posts;

  AuthOtpState({required this.posts});

  AuthOtpState copyWith({List<FakePost>? posts}){
    return AuthOtpState(posts: posts ?? this.posts);
  }
}