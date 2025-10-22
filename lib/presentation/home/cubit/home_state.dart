// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:booking_tour_flutter/domain/fake_post.dart';
import 'package:booking_tour_flutter/models/activity.dart';

class HomeState {
  final List<Activity> activities;

  HomeState({required this.activities});

  HomeState copyWith({List<Activity>? activities}) {
    return HomeState(activities: activities ?? this.activities);
  }
}
