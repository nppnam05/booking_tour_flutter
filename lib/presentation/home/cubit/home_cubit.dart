import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/presentation/home/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  static final bookingRepository = getIt<BookingRepository>();
  HomeCubit() : super(HomeState(activities: []));

  Future<void> syncPost() async {
    var result = await bookingRepository.getActivities();

    result.fold((failure) {}, (activities) {
      emit(state.copyWith(activities: activities));
    });
  }
}
