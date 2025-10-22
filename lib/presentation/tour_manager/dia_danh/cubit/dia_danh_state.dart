import 'package:booking_tour_flutter/domain/location.dart';

class DiaDanhState {
  final List<Location> locations;

  DiaDanhState({
    required this.locations
  });

  DiaDanhState copyWith({List<Location>? location }){
    return DiaDanhState(locations: location ?? this.locations);
  }
}