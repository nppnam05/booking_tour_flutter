import 'package:booking_tour_flutter/data/response/province_response.dart';
import 'package:booking_tour_flutter/domain/place.dart';
import 'package:booking_tour_flutter/domain/province.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_response.g.dart';

@JsonSerializable()
class PlaceResponse {
  int? id;
  String? name;
  @JsonKey(name: 'location')
  ProvinceResponse? province;

  PlaceResponse({this.id, this.name, this.province});

  factory PlaceResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaceResponseFromJson(json);
}

extension PlaceResponseMapper on PlaceResponse {
  Place map() {
    return Place(
      id: id ?? 0,
      name: name ?? "",
      province: province?.map() ?? Province(id: 0, name: ""),
    );
  }
}
