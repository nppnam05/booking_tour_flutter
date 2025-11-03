import 'package:booking_tour_flutter/presentation/profile/review_schedule/cubit/review_schedule_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewScheduleCubit extends Cubit<ReviewScheduleState> {
  ReviewScheduleCubit() : super(ReviewScheduleState(stars: 5, review: ""));

  void setStars(int stars) {
    emit(state.copyWith(stars: stars));
  }

  void setComment(String comment) {
    emit(state.copyWith(comment: comment));
  }
}
