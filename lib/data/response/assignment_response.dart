import 'package:booking_tour_flutter/domain/assignment.dart';
import 'package:booking_tour_flutter/domain/place.dart';
import 'package:booking_tour_flutter/domain/province.dart';
import 'package:json_annotation/json_annotation.dart';

part 'assignment_response.g.dart';

@JsonSerializable()
class AssignmentResponse {
  int? idSchedule;
  String? titleTour;
  List<String>? tourImages;
  List<String>? nameLocations;
  List<String>? placeNames;

  AssignmentResponse({
    this.idSchedule,
    this.titleTour,
    this.tourImages,
    this.nameLocations,
    this.placeNames,
  });

  factory AssignmentResponse.fromJson(Map<String, dynamic> json) =>
      _$AssignmentResponseFromJson(json);
}

extension AssignmentResponseMapper on AssignmentResponse {
  Assignment map() {
    final firstImage = (tourImages != null && tourImages!.isNotEmpty)
        ? tourImages!.first
        : '';

    final firstLocation = (nameLocations != null && nameLocations!.isNotEmpty)
        ? nameLocations!.first
        : '';
    final placesText = (placeNames != null && placeNames!.isNotEmpty)
        ? placeNames!.join(', ')
        : '';

    return Assignment(
      titleTour: titleTour ?? "",
      placeNames: Place(
        id: 0,
        name: placesText,
        province: Province(id: 0, name: firstLocation),
      ),
      nameLocations: Province(id: 0, name: firstLocation),
      tourImages: firstImage,
    );
  }
}