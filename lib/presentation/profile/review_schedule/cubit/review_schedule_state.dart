class ReviewScheduleState {
  final int stars;
  final String review;
  final int userId;
  final int scheduleId;
  final bool sentReview;
  final String? errorMessage;

  ReviewScheduleState({
    required this.stars,
    required this.review,
    this.userId = 6,
    this.scheduleId = 22,
    this.sentReview = false,
    this.errorMessage,
  });

  ReviewScheduleState copyWith({
    int? stars,
    String? review,
    int? userId,
    int? scheduleId,
    bool? sentReview,
    String? errorMessage,
  }) {
    return ReviewScheduleState(
      stars: stars ?? this.stars,
      review: review ?? this.review,
      userId: userId ?? this.userId,
      scheduleId: scheduleId ?? this.scheduleId,
      sentReview: sentReview ?? false,
      errorMessage: errorMessage,
    );
  }
}
