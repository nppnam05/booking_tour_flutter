import 'package:booking_tour_flutter/domain/review.dart';

class ChiTietLichTrinhState {
  final bool isLoading;
  final List<Review> reviews;

  ChiTietLichTrinhState({this.isLoading = false, this.reviews = const []});

  ChiTietLichTrinhState copyWith({bool? isLoading, List<Review>? reviews}) {
    return ChiTietLichTrinhState(
      isLoading: isLoading ?? this.isLoading,
      reviews: reviews ?? this.reviews,
    );
  }
}
