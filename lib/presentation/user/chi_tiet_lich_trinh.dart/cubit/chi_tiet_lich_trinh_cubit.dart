import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/data/request/user/get_reviews_request.dart';
import 'package:booking_tour_flutter/presentation/user/chi_tiet_lich_trinh.dart/cubit/chi_tiet_lich_trinh_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChiTietLichTrinhCubit extends Cubit<ChiTietLichTrinhState> {
  static final bookingRepository = getIt<BookingRepository>();

  ChiTietLichTrinhCubit() : super(ChiTietLichTrinhState());

  Future<void> loadRviews(int tourId, int userId) async {
    GetReviewsRequest request = GetReviewsRequest(
      tourId: tourId,
      userId: userId,
    );
    emit(state.copyWith(isLoading: true));

    final result = await bookingRepository.getReview(request);

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false));
      },
      (reviews) {
        emit(state.copyWith(reviews: reviews, isLoading: false));
      },
    );
  }
}
