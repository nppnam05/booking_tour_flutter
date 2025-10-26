import 'dart:ffi';

import 'package:booking_tour_flutter/domain/place.dart';
import 'package:booking_tour_flutter/domain/province.dart';

class  Assignment {
final String titleTour ;
final Place placeNames ;
final Province nameLocations;
final String tourImages; 
Assignment(
  {
    required this.titleTour,
    required this.placeNames,
    required this.nameLocations,
    required this.tourImages
  }
);

}
