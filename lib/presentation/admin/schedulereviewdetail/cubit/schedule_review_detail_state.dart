// lib/presentation/admin/schedule_review_detail/cubit/schedule_review_detail_state.dart
import 'package:booking_tour_flutter/domain/review.dart';
import 'package:booking_tour_flutter/domain/schedule_tourguide.dart';  // ✅ Import đúng

abstract class ScheduleReviewDetailState {}

class ScheduleReviewDetailInitial extends ScheduleReviewDetailState {}

class ScheduleReviewDetailLoading extends ScheduleReviewDetailState {}

class ScheduleReviewDetailLoaded extends ScheduleReviewDetailState {
  final List<Review> reviews;
  final ScheduleTourguide schedule;  // ✅ Dùng ScheduleTourguide
  final int? selectedStarFilter;

  ScheduleReviewDetailLoaded({
    required this.reviews,
    required this.schedule,
    this.selectedStarFilter,
  });

  List<Review> get filteredReviews {
    if (selectedStarFilter == null) return reviews;
    return reviews.where((r) => r.rating == selectedStarFilter).toList();
  }

  double get averageRating {
    if (reviews.isEmpty) return 0;
    return reviews.fold<double>(0, (sum, r) => sum + r.rating) / reviews.length;
  }

  Map<int, int> get ratingDistribution {
    final distribution = <int, int>{1: 0, 2: 0, 3: 0, 4: 0, 5: 0};
    for (var review in reviews) {
      distribution[review.rating] = (distribution[review.rating] ?? 0) + 1;
    }
    return distribution;
  }

  ScheduleReviewDetailLoaded copyWith({
    List<Review>? reviews,
    ScheduleTourguide? schedule,
    int? selectedStarFilter,
    bool clearFilter = false,
  }) {
    return ScheduleReviewDetailLoaded(
      reviews: reviews ?? this.reviews,
      schedule: schedule ?? this.schedule,
      selectedStarFilter: clearFilter ? null : (selectedStarFilter ?? this.selectedStarFilter),
    );
  }
}

class ScheduleReviewDetailError extends ScheduleReviewDetailState {
  final String message;

  ScheduleReviewDetailError(this.message);
}