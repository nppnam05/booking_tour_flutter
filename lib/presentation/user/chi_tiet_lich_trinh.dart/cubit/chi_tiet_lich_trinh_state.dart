import 'package:booking_tour_flutter/domain/helpful.dart';
import 'package:booking_tour_flutter/domain/review.dart';

class ChiTietLichTrinhState {
  final bool isLoading;
  final List<Review> reviews;
  final List<Helpful> helpFul;

  ChiTietLichTrinhState({
    this.isLoading = false,
    this.reviews = const [],
    this.helpFul = const [],
  });

  ChiTietLichTrinhState copyWith({
    bool? isLoading,
    List<Review>? reviews,
    List<Helpful>? helpFul,
  }) {
    return ChiTietLichTrinhState(
      isLoading: isLoading ?? this.isLoading,
      reviews: reviews ?? this.reviews,
      helpFul: helpFul ?? this.helpFul,
    );
  }
}
