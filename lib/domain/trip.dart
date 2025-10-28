// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:booking_tour_flutter/domain/day_of_tour.dart';
import 'package:flutter/foundation.dart';

import 'package:booking_tour_flutter/domain/province.dart';

class Trip {
  final int id;
  final int day;
  final String title;
  final int price;
  final String description;
  final List<Province> provinces;
  final List<String> tourImages;
  final List<DayOfTour> dayOfTours;

  Trip({
    required this.id,
    required this.day,
    required this.title,
    required this.price,
    required this.description,
    required this.provinces,
    required this.tourImages,
    required this.dayOfTours,
  });

  Trip copyWith({
    int? id,
    int? day,
    String? title,
    int? price,
    String? description,
    List<Province>? provinces,
    List<String>? tourImages,
    List<DayOfTour>? dayOfTours,
  }) {
    return Trip(
      id: id ?? this.id,
      day: day ?? this.day,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      provinces: provinces ?? this.provinces,
      tourImages: tourImages ?? this.tourImages,
      dayOfTours: dayOfTours ?? this.dayOfTours,
    );
  }
}
