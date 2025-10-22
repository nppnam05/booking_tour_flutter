import 'package:booking_tour_flutter/domain/fake_post.dart';

class RegisterState {
  final List<FakePost> posts;

  RegisterState({required this.posts});

  RegisterState copyWith({List<FakePost>? posts}){
    return RegisterState(posts: posts ?? this.posts);
  }
}