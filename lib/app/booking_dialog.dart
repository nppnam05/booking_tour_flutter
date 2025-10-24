import 'package:booking_tour_flutter/app/app_navigator.dart';
import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/app/dialog_helper.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/domain/activity.dart';
import 'package:booking_tour_flutter/domain/location_activity.dart';
import 'package:booking_tour_flutter/domain/place.dart';
import 'package:booking_tour_flutter/domain/province.dart';

class BookingDialog {
  static final _repository = getIt<BookingRepository>();

  static Future<List<Activities>?> selectMultiProvince() async {
    var result = await _repository.getProvinces();
    result.fold(
      (failure) {
        throw Exception(failure.message);
      },
      (provinces) {
        return DialogHelper.selectMany<Activities>(
          context: AppNavigator.navigatorKey.currentState!.context,
          title: "Chọn tỉnh thành",
          items: provinces,
          display: (province) {
            return province.name;
          },
        );
      },
    );
  }

  static Future<Activity?> selectSingleActivity({
    int? locationActivityId,
  }) async {
    var result = await _repository.getActivities(
      locationActivityId: locationActivityId,
    );

    result.fold(
      (failure) {
        throw Exception(failure.message);
      },
      (activities) {
        return DialogHelper.selectOne(
          context: AppNavigator.currentContext,
          title: "Chọn hoạt động",
          items: activities,
          display: (activity) {
            return activity.action;
          },
        );
      },
    );
  }

  static Future<Place?> selectSinglePlace({
    List<int> provinceIds = const [],
  }) async {
    var result = await _repository.getPlaces(provinceIds: provinceIds);

    result.fold(
      (failure) {
        throw Exception(failure);
      },
      (places) {
        return DialogHelper.selectOne(
          context: AppNavigator.currentContext,
          title: "Chọn địa danh",
          items: places,
          display: (place) {
            return place.name;
          },
        );
      },
    );
  }

  static Future<LocationActivity?> selectSingleLocationActivity({
    required int placeId,
  }) async {
    var result = await _repository.getLocationActivities(placeId: placeId);

    result.fold(
      (failure) {
        throw Exception(failure);
      },
      (locationActivities) {
        return DialogHelper.selectOne(
          context: AppNavigator.currentContext,
          title: "Chọn địa điểm hoạt động",
          items: locationActivities,
          display: (locationActivity) {
            return locationActivity.name;
          },
        );
      },
    );
  }
}
