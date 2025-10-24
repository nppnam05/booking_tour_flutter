
import 'dart:ffi';

import 'package:booking_tour_flutter/domain/province.dart';

class Trip {
  final int id;
  final String title;
  final Province province;
  final int price;
  final String tourImages;

  Trip({
    required this.id,
    required this.title,
    required this.province,
    required this.price,
    required this.tourImages,
  });
}
