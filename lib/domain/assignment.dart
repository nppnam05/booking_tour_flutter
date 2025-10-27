import 'dart:ffi';

import 'package:booking_tour_flutter/domain/place.dart';
import 'package:booking_tour_flutter/domain/province.dart';

class  Assignment {
final String titleTour ;
final Place placeNameDTOs ;
final Province nameLocations;
final String tourImageDTOs; 
Assignment(
  {
    required this.titleTour,
    required this.placeNameDTOs,
    required this.nameLocations,
    required this.tourImageDTOs
  }
);

}
