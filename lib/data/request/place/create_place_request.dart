import 'package:booking_tour_flutter/data/response/province_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_place_request.g.dart';

@JsonSerializable(explicitToJson: true)
class PlaceResponse {
  String? name;
  ProvinceResponse? location;

  PlaceResponse({this.name, this.location});

  Map<String, dynamic> toJson() => _$PlaceResponseToJson(this);
}