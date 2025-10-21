import '../models/trip.dart';

abstract class TripEvent {}

class LoadTrips extends TripEvent {}

class AddTrip extends TripEvent {
  final Trip trip;
  AddTrip(this.trip);
}

class DeleteTrip extends TripEvent {
  final Trip trip;
  DeleteTrip(this.trip);
}
