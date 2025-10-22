import 'package:json_annotation/json_annotation.dart';
import 'package:booking_tour_flutter/models/trip.dart';
part 'trip_manager_response.g.dart';

@JsonSerializable()
class TripManagerResponse {
  int? id;
  String? title;
  String? location;
  String? imageUrl;
  int? price;
  TripManagerResponse({this.id, this.title, this.location, this.imageUrl, this.price});
  factory TripManagerResponse.fromJson(Map<String, dynamic> json) =>
      _$TripManagerResponseFromJson(json);
  
}
extension TripManagerResponseMapper on TripManagerResponse {
  Trip map() {
    return Trip(
      id :id ?? 0,
      title: title ?? "",
      location: location ?? "",
      price: price ?? 0,
      imageUrl: imageUrl ?? "",
    );
  }
}