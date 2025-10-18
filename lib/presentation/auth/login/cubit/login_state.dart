import 'package:booking_tour_flutter/domain/fake_post.dart';

class LoginState{
  final List<FakePost> posts;
  
  LoginState({required this.posts});

  LoginState copyWith({List<FakePost>? posts}){
    return LoginState(posts:  posts ?? this.posts);
  }
}