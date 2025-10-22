// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:booking_tour_flutter/models/province.dart';

class Place {
  int id;
  String name;
  Province province;

  Place({required this.id, required this.name, required this.province});
}
