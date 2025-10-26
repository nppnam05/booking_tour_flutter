// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:booking_tour_flutter/domain/location.dart';

class Place {
  int id;
  String name;
  Location location;

  Place({required this.id, required this.name, required this.location});
}
