import 'package:booking_tour_flutter/domain/schedule_tourmanager.dart';
import 'package:booking_tour_flutter/domain/trip.dart';
import 'package:booking_tour_flutter/domain/province.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schedule_tourmanager_response.g.dart';

@JsonSerializable()
class ScheduleTourmanagerResponse {
  int? id;
  int? tourId;
  String? startDate;
  String? endDate;
  String? openDate;
  int? maxSlot;
  int? finalPrice;
  String? gatheringTime;
  String? code;
  int? desposit;
  TripResponse? tour;

  ScheduleTourmanagerResponse({
    this.id,
    this.tourId,
    this.startDate,
    this.endDate,
    this.openDate,
    this.maxSlot,
    this.finalPrice,
    this.gatheringTime,
    this.code,
    this.desposit,
    this.tour,
  });

  factory ScheduleTourmanagerResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleTourmanagerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleTourmanagerResponseToJson(this);
}

@JsonSerializable()
class TripResponse {
  int? id;
  String? title;
  int? price;
  List<dynamic>? tourImages;
  List<ProvinceResponse>? locations;

  TripResponse({
    this.id,
    this.title,
    this.price,
    this.tourImages,
    this.locations,
  });

  factory TripResponse.fromJson(Map<String, dynamic> json) =>
      _$TripResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TripResponseToJson(this);

  Trip map() {
    final images = tourImages?.map((e) => e.toString()).toList() ?? [];
    final provinceList = locations?.map((e) => e.map()).toList() ?? [];

    return Trip(
      id: id ?? 0,
      day: 0,
      title: title ?? '',
      price: price ?? 0,
      percentDeposit: 0,
      description: '',
      provinces: provinceList,
      tourImages: images,
      dayOfTours: [],
    );
  }
}

@JsonSerializable()
class ProvinceResponse {
  int? id;
  String? name;

  ProvinceResponse({this.id, this.name});

  factory ProvinceResponse.fromJson(Map<String, dynamic> json) =>
      _$ProvinceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceResponseToJson(this);

  Province map() {
    return Province(id: id ?? 0, name: name ?? '');
  }
}

extension ScheduleTourmanagerResponseMapper on ScheduleTourmanagerResponse {
  ScheduleTourmanager map() {
    final start = _parseDate(startDate);
    final end = _parseDate(endDate);
    final open = _parseDate(openDate);

    return ScheduleTourmanager(
      id: id ?? 0,
      tourId: tourId ?? 0,
      startDate: start,
      endDate: end,
      openDate: open,
      maxSlot: maxSlot ?? 0,
      finalPrice: finalPrice ?? 0,
      gatheringTime: gatheringTime ?? '',
      code: code ?? '',
      desposit: desposit ?? 0,
      tour:
          tour?.map() ??
          Trip(
            id: 0,
            day: 0,
            title: '',
            price: 0,
            percentDeposit: 0,
            description: '',
            provinces: [],
            tourImages: [],
            dayOfTours: [],
          ),
    );
  }

  DateTime _parseDate(String? dateStr) {
    try {
      return dateStr != null ? DateTime.parse(dateStr) : DateTime.now();
    } catch (_) {
      return DateTime.now();
    }
  }
}
