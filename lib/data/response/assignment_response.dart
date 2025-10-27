import 'package:booking_tour_flutter/domain/assignment.dart';
import 'package:booking_tour_flutter/domain/place.dart';
import 'package:booking_tour_flutter/domain/province.dart';
import 'package:json_annotation/json_annotation.dart';

part 'assignment_response.g.dart';

@JsonSerializable()
class AssignmentResponse {
  int? idSchedule;
  String? titleTour;
  List<String>? tourImageDTOs;
  List<String>? nameLocations;
  List<String>? placeNameDTOs;

  AssignmentResponse({
    this.idSchedule,
    this.titleTour,
    this.tourImageDTOs,
    this.nameLocations,
    this.placeNameDTOs,
  });

  factory AssignmentResponse.fromJson(Map<String, dynamic> json) =>
      _$AssignmentResponseFromJson(json);
}

extension AssignmentResponseMapper on AssignmentResponse {
  Assignment map() {
    final firstImage = (tourImageDTOs != null && tourImageDTOs!.isNotEmpty)
        ? tourImageDTOs!.first
        : '';

    final firstLocation = (nameLocations != null && nameLocations!.isNotEmpty)
        ? nameLocations!.first
        : '';
    final placesText = (placeNameDTOs != null && placeNameDTOs!.isNotEmpty)
        ? placeNameDTOs!.join(', ')
        : '';

    return Assignment(
      titleTour: titleTour ?? "",
      placeNameDTOs: Place(
        id: 0,
        name: placesText,
        province: Province(id: 0, name: firstLocation),
      ),
      nameLocations: Province(id: 0, name: firstLocation),
      tourImageDTOs: firstImage,
    );
  }
}