import 'package:booking_tour_flutter/data/response/province_response.dart';
import 'package:booking_tour_flutter/domain/province.dart';
import 'package:booking_tour_flutter/domain/trip.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:booking_tour_flutter/domain/province.dart';
part 'trip_manager_response.g.dart';

@JsonSerializable()
class TripManagerResponse {
  int? id;
  String? title;
    List<dynamic>?  tourImages;
  int? price;
  ProvinceResponse ? province;
  TripManagerResponse({this.id, this.title, this.tourImages, this.price, this.province});
  factory TripManagerResponse.fromJson(Map<String, dynamic> json) =>
      _$TripManagerResponseFromJson(json);
       Map<String, dynamic> toJson() => _$TripManagerResponseToJson(this);
  }
extension TripManagerResponseMapper on TripManagerResponse {
  Trip map() {
    final firstImageUrl = (tourImages != null && tourImages!.isNotEmpty)
        ? tourImages!.first 
        : '';
    return Trip(
      id: id ?? 0,
      title: title ?? "",
      province: province?.map() ?? Province(id: 0, name: ""),
      price: price ?? 0,
      tourImages: firstImageUrl,
    );
  }
}


