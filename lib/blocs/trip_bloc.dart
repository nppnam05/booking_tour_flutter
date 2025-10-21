import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/trip.dart';
import 'trip_event.dart';
import 'trip_state.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  List<Trip> _trips = [
    Trip(
      title: 'Chuyến đi Phú Quốc 3N',
      location: 'Hạ Long',
      price: 500000,
      imageUrl: 'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=400',
    ),
    Trip(
      title: 'Tour Hà Nội 3N',
      location: 'Hà Nội',
      price: 500000,
      imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400',
    ),
    Trip(
      title: 'Du lịch Đà Nẵng 4N',
      location: 'Đà Nẵng',
      price: 750000,
      imageUrl: 'https://images.unsplash.com/photo-1528127269322-539801943592?w=400',
    ),
  ];

  TripBloc() : super(TripInitial()) {
    on<LoadTrips>((event, emit) {
      emit(TripLoaded(_trips));
    });

    on<AddTrip>((event, emit) {
      _trips.add(event.trip);
      emit(TripLoaded(List.from(_trips)));
    });

    on<DeleteTrip>((event, emit) {
      _trips.remove(event.trip);
      emit(TripLoaded(List.from(_trips)));
    });
  }
}
