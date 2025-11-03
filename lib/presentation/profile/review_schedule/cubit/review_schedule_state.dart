// ignore_for_file: public_member_api_docs, sort_constructors_first
class ReviewScheduleState {
  final int stars;
  final String review;

  ReviewScheduleState({required this.stars, required this.review});

  ReviewScheduleState copyWith({int? stars, String? comment}) {
    return ReviewScheduleState(
      stars: stars ?? this.stars,
      review: comment ?? this.review,
    );
  }
}
