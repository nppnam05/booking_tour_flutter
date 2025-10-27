import 'package:booking_tour_flutter/domain/guide.dart';
import 'package:booking_tour_flutter/domain/schedule_assignment_tourguide.dart';
import 'package:booking_tour_flutter/domain/tour_guide.dart';

class TourGuideAssignmentState {
  final ScheduleAssignmentTourguide schedule;
  final List<TourGuide> tourGuides;
  final List<TourGuide> tourGuidesSearch;


  TourGuideAssignmentState({required this.schedule ,required this.tourGuides, required this.tourGuidesSearch});

  TourGuideAssignmentState copyWith({ ScheduleAssignmentTourguide? schedule, List<TourGuide>? tourGuides, List<TourGuide>? tourGuidesSearch}) {
    return TourGuideAssignmentState( schedule: schedule ?? this.schedule, tourGuides: tourGuides ?? this.tourGuides,
     tourGuidesSearch: tourGuidesSearch ?? this.tourGuidesSearch);
  }
}