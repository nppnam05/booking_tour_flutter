import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/presentation/home/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  static final bookingRepository = getIt<BookingRepository>();
  HomeCubit() : super(HomeState(posts: []));

  Future<void> syncPost() async {
    var result = await bookingRepository.getPost();
    result.fold((failure) {}, (posts) {
      emit(state.copyWith(posts: posts));
    });
  }
}
