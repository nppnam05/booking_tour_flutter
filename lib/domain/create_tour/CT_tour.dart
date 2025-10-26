// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:booking_tour_flutter/data/request/create_tour_request.dart';
import 'package:booking_tour_flutter/domain/create_tour/CT_day_of_tour.dart';
import 'package:booking_tour_flutter/domain/province.dart';

class CTTour {
  String tourName;
  String description;
  String price;
  String percent;

  CTTour({
    this.tourName = "",
    this.description = "",
    this.price = "",
    this.percent = "",
  });
}

extension CTMapper on CTTour {
  CreateTourRequest mapToRequest() {
    var priceValue = int.tryParse(price);
    var percentValue = int.tryParse(percent);

    if (tourName.isEmpty ||
        description.isEmpty ||
        priceValue == null ||
        percentValue == null) {
      throw Exception("can't create create_tour_request");
    }

    return CreateTourRequest(
      day: 0,
      title: tourName,
      price: priceValue,
      description: description,
      dayOfTours: [],
    );
  }
}
