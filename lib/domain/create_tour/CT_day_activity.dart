import 'package:booking_tour_flutter/data/request/create_day_activity_request.dart';
import 'package:booking_tour_flutter/domain/activity.dart';
import 'package:booking_tour_flutter/domain/location_activity.dart';
import 'package:booking_tour_flutter/domain/place.dart';
import 'package:flutter/material.dart';

class CTDayActivity {
  TimeOfDay? time;
  Place? place;
  LocationActivity? locationActivity;
  Activity? activity;
}

extension CTDayActivityMapper on CTDayActivity {
  CreateDayActivityRequest mapToRequest() {
    if (locationActivity == null || activity == null || time == null) {
      throw Exception("can't create create_day_activity_request");
    }

    return CreateDayActivityRequest(
      activityId: activity!.id,
      locationActivityId: locationActivity!.id,
      time: "${time!.hour}:${time!.minute}",
    );
  }
}
