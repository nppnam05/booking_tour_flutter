
import '../models/trip.dart';

abstract class TripState {}

class TripInitial extends TripState {}

class TripLoaded extends TripState {
  final List<Trip> trips;
  TripLoaded(this.trips);
}
