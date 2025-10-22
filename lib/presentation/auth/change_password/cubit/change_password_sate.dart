import 'package:booking_tour_flutter/domain/fake_post.dart';

class ChangePasswordSate {
  final List<FakePost> posts;

  ChangePasswordSate({required this.posts});

  ChangePasswordSate copyWith({List<FakePost>? posts}){
    return ChangePasswordSate(posts:  posts ?? this.posts);
  }
}