// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:booking_tour_flutter/data/response/day_of_tour_response.dart';
import 'package:booking_tour_flutter/data/response/province_response.dart';
import 'package:booking_tour_flutter/domain/province.dart';
import 'package:booking_tour_flutter/domain/province.dart';
import 'package:booking_tour_flutter/domain/trip.dart';

part 'trip_manager_response.g.dart';

@JsonSerializable()
class TripManagerResponse {
  int? id;
  int? day;
  String? title;
  int? price;
  int? percentDeposit;
  String? description;
  List<String>? tourImages;
  List<ProvinceResponse>? locations;
  List<DayOfTourResponse>? dayOfTours;

  TripManagerResponse({
    this.id,
    this.day,
    this.title,
    this.price,
    this.percentDeposit,
    this.description,
    this.tourImages,
    this.locations,
    this.dayOfTours,
  });

  factory TripManagerResponse.fromJson(Map<String, dynamic> json) =>
      _$TripManagerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TripManagerResponseToJson(this);
}

extension TripManagerResponseMapper on TripManagerResponse {
  Trip map() {
    if (locations == null) {
      throw Exception("province is null");
    }

    locations = locations ?? [];
    tourImages = tourImages ?? [];
    dayOfTours = dayOfTours ?? [];

    return Trip(
      id: id ?? 0,
      day: day ?? 0,
      title: title ?? "",
      price: price ?? 0,
      percentDeposit: percentDeposit ?? 0,
      description: description ?? "",
      provinces: locations!.map((i) => i.map()).toList(),
      tourImages: tourImages!,
      dayOfTours: dayOfTours!.map((i) => i.map()).toList(),
    );
  }
}
