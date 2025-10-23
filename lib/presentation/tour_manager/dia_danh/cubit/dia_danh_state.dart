import 'package:booking_tour_flutter/domain/location.dart';

class DiaDanhState {
  final List<Location> locations;
  final Location? selectedLocation;

  DiaDanhState({required this.locations, this.selectedLocation});

  DiaDanhState copyWith({
    List<Location>? location,
    Location? selectedLocation,
  }) {
    return DiaDanhState(
      locations: location ?? this.locations,
      selectedLocation: selectedLocation ?? this.selectedLocation,
    );
  }
}
