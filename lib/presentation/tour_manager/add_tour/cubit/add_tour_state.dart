// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:booking_tour_flutter/presentation/tour_manager/add_tour/cubit/validate_state.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import 'package:booking_tour_flutter/domain/create_tour/CT_day_of_tour.dart';
import 'package:booking_tour_flutter/domain/create_tour/CT_tour.dart';
import 'package:booking_tour_flutter/domain/province.dart';

class AddTourState {
  final CTTour tour;
  final List<CTDayOfTour> daysOfTour;
  final int selectedDayOfTour;
  final List<Province> provinces;
  final List<Either<File, String>> images;
  late final ValidateState validateState;

  AddTourState({
    required this.tour,
    required this.daysOfTour,
    required this.selectedDayOfTour,
    required this.provinces,
    required this.images,
    ValidateState? validateState,
  }) {
    this.validateState =
        validateState ?? ValidateState(errors: {}, isValidated: false);
  }

  AddTourState copyWith({
    CTTour? tour,
    List<CTDayOfTour>? daysOfTour,
    int? selectedDayOfTour,
    List<Province>? provinces,
    List<Either<File, String>>? images,
    ValidateState? validateState,
  }) {
    return AddTourState(
      tour: tour ?? this.tour,
      daysOfTour: daysOfTour ?? this.daysOfTour,
      selectedDayOfTour: selectedDayOfTour ?? this.selectedDayOfTour,
      provinces: provinces ?? this.provinces,
      images: images ?? this.images,
      validateState: validateState ?? this.validateState,
    );
  }

  String? getErrorMessage(String key) {
    return validateState.errors[key];
  }

  bool get isValidated => validateState.isValidated;
}
