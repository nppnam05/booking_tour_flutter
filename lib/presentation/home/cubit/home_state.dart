// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:booking_tour_flutter/domain/fake_post.dart';

class HomeState {
  final List<FakePost> posts;

  HomeState({required this.posts});

  HomeState copyWith({List<FakePost>? posts}) {
    return HomeState(posts: posts ?? this.posts);
  }
}
