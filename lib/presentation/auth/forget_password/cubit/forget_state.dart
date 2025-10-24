import 'package:booking_tour_flutter/domain/fake_post.dart';

class ForgetState {
  final List<FakePost> posts;

  ForgetState({required this.posts});

  ForgetState copyWith({List<FakePost>? posts}){
    return ForgetState(posts: posts ?? this.posts);
  }
}