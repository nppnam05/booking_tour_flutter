import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/app/dialog_helper.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/presentation/profile/review_schedule/cubit/review_schedule_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewScheduleCubit extends Cubit<ReviewScheduleState> {
  final BookingRepository _repository = getIt<BookingRepository>();
  ReviewScheduleCubit() : super(ReviewScheduleState(stars: 5, review: ""));

  void setUserId(int userId) {
    emit(state.copyWith(userId: userId));
  }

  void setScheduleId(int scheduleId) {
    emit(state.copyWith(scheduleId: scheduleId));
  }

  void setStars(int stars) {
    emit(state.copyWith(stars: stars));
  }

  void setComment(String review) {
    emit(state.copyWith(review: review));
  }

  Future<void> sendReview() async {
    await DialogHelper.showLoadingDialog();
    var result = await _repository.createReview(
      userId: state.userId,
      scheduleId: state.scheduleId,
      content: state.review,
      rating: state.stars,
    );

    result.fold((failure) {

    }, (success) {
      emit(state.copyWith(sentReview: true));
    });
    DialogHelper.dismissDialog();
  }
}
