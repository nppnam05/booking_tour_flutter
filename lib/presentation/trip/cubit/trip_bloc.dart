import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/domain/trip.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'trip_state.dart';

class TripCubit extends Cubit<TripState> {
  static final bookingRepository = getIt<BookingRepository>();

  TripCubit() : super(TripInitial());

  Future<void> loadTrips({String? sortBy, String? order}) async {
    emit(TripLoading());
  
    final result = await bookingRepository.getTrips(
      sortBy: sortBy ?? "Title",
      order: order ?? "ASC",
    );

    result.fold(
      (failure) => emit(TripError(failure.message)),
      (trips) => emit(TripLoaded(trips)),
    );
  }

  Future<void> deleteTrip(Trip trip) async {
    if (state is TripLoaded) {
      final currentTrips = (state as TripLoaded).trips;
      emit(TripLoading());

      final result = await bookingRepository.deleteTrip(id: trip.id);

      result.fold(
        (failure) => emit(TripError(failure.message)),
        (_) {
          final updatedTrips =
              currentTrips.where((t) => t.id != trip.id).toList();
          emit(TripLoaded(updatedTrips));
        },
      );
    }
  }
}
