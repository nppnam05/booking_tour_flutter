import 'dart:ffi';
import 'dart:io';
import 'package:booking_tour_flutter/app/app_encode_helper.dart';
import 'package:booking_tour_flutter/data/network/dio/error_handler.dart';
import 'package:booking_tour_flutter/data/network/dio/failure.dart';
import 'package:booking_tour_flutter/data/response/activity_response.dart';
import 'package:booking_tour_flutter/data/response/assignment_response.dart';
import 'package:booking_tour_flutter/data/response/add_activity_response.dart';
import 'package:booking_tour_flutter/data/response/add_location_activity_response.dart';
import 'package:booking_tour_flutter/data/response/location_activity_response.dart';
import 'package:booking_tour_flutter/data/response/place_response.dart';
import 'package:booking_tour_flutter/data/response/province_response.dart';
import 'package:booking_tour_flutter/data/response/schedule_assignment_tourguide_response.dart';
import 'package:booking_tour_flutter/data/response/tour_guide_response.dart';
import 'package:booking_tour_flutter/data/response/user_response.dart';
import 'package:booking_tour_flutter/data/response/trip_manager_response.dart';
import 'package:booking_tour_flutter/data/response/put_activity_response.dart';
import 'package:booking_tour_flutter/data/response/update_location_activities_response.dart';
import 'package:booking_tour_flutter/domain/activity.dart';
import 'package:booking_tour_flutter/domain/create_tour/CT_day_of_tour.dart';
import 'package:booking_tour_flutter/domain/create_tour/CT_tour.dart';
import 'package:booking_tour_flutter/domain/assignment.dart';
import 'package:booking_tour_flutter/domain/location_activity.dart';
import 'package:booking_tour_flutter/domain/place.dart';
import 'package:booking_tour_flutter/domain/province.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/lich_trinh/danh_sach_lich_trinh.dart';
import 'package:booking_tour_flutter/domain/trip.dart';
import 'package:booking_tour_flutter/domain/schedule_assignment_tourguide.dart';
import 'package:booking_tour_flutter/domain/tour_guide.dart';
import 'package:booking_tour_flutter/domain/user.dart';
import 'package:booking_tour_flutter/domain/requests/add_activity_request.dart';
import 'package:booking_tour_flutter/domain/requests/add_location_activity_request.dart';
import 'package:booking_tour_flutter/domain/requests/add_place_request.dart';
import 'package:booking_tour_flutter/domain/requests/fix_activity_request.dart';
import 'package:booking_tour_flutter/domain/requests/update_location_activities.dart';
import 'package:dartz/dartz.dart';

import 'package:booking_tour_flutter/data/network/core_service.dart';
import 'package:booking_tour_flutter/data/response/fake_post_response.dart';
import 'package:booking_tour_flutter/domain/fake_post.dart';
import 'package:injectable/injectable.dart';

abstract class BookingRepository {
  Future<Either<Failure, List<FakePost>>> getPost();

  Future<Either<Failure, bool>> checkAssignment({
    required int scheduleId,
    required List<TourGuideResponse> tourGuides,
  });

  Future<Either<Failure, List<TourGuide>>> getTourGuides({
    required int idschedule,
  });

  Future<Either<Failure, ScheduleAssignmentTourguide>>
  getScheduleAssignmentById({required int id});

  Future<Either<Failure, User>> postLogin({
    required String email,
    required String password,
  });

  Future<Either<Failure, List<Activity>>> getActivities({
    int? locationActivityId,
    String sortBy = "action",
    String order = "ASC",
  });

  Future<Either<Failure, List<Province>>> getProvinces();

  Future<Either<Failure, List<Place>>> getPlaces({
    List<int> provinceIds = const [],
    String sortBy = "Name",
    String order = "ASC",
  });

  Future<Either<Failure, List<LocationActivity>>> getLocationActivities({
    required int placeId,
    String sortBy = "Name",
    String order = "ASC",
    String? filter,
  });
  Future<Either<Failure, List<Trip>>> getTrips({
    String sortBy = "Title",
    String order = "ASC",
    String? filter,
  });
  Future<Either<Failure, void>> deleteTrip({required int id});

  Future<Either<Failure, List<Assignment>>> getAssignments();

  Future<Either<Failure, Trip>> createTour({
    required CTTour tour,
    required List<CTDayOfTour> dayOfTours,
    required List<Either<File, String>> images,
  });

  Future<Either<Failure, Trip>> updateTour({
    required int id,
    required CTTour tour,
    required List<CTDayOfTour> dayOfTours,
    required List<Either<File, String>> images,
  });

  Future<Either<Failure, Place>> updatePlace({
    required int id,
    required String name,
    required int locationId,
  });

  Future<Either<Failure, Place>> createPlace({
    required String name,
    required int locationId,
  });

  Future<Either<Failure, Place>> deletePlace({required int id});

  Future<Either<Failure, List<Activity>>> postActivity(String action);
  Future<Either<Failure, List<Activity>>> putActivity(int id, String action);
  Future<Either<Failure, bool>> deleteActivity(int id);
  Future<Either<Failure, Place>> addPlace(AddPlaceRequest request);
  Future<Either<Failure, AddLocationActivityResponse>> addLocationActivities(
    AddLocationActivityRequest request,
  );
  Future<Either<Failure, UpdateLocationActivitiesResponse>>
  updateLocationActivities(UpdateLocationActivities request);
}

@Singleton(as: BookingRepository)
class BookingRepositoryImp implements BookingRepository {
  final CoreService _coreService;

  BookingRepositoryImp(this._coreService);

  Future<Either<Failure, UpdateLocationActivitiesResponse>>
  updateLocationActivities(UpdateLocationActivities request) async {
    try {
      final response = await _coreService.updateLocationActivities(request);
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, AddLocationActivityResponse>> addLocationActivities(
    AddLocationActivityRequest request,
  ) async {
    try {
      final response = await _coreService.addLocationActivities(request);
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, Place>> addPlace(AddPlaceRequest request) async {
    try {
      final response = await _coreService.addPlace(request.toJson());
      return Right(response.map());
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> deleteActivity(int id) async {
    try {
      final response = await _coreService.deleteActivity(id);
      return Right(response.data ?? false);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<Activity>>> putActivity(
    int id,
    String action,
  ) async {
    try {
      final response = await _coreService.updateActivity(
        FixActivityRequest(action: action, id: id),
      );
      final activity = response.map();
      return Right(activity != null ? [activity] : []);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<Activity>>> postActivity(String action) async {
    try {
      final AddActivityResponse response = await _coreService.addActivity(
        AddActivityRequest(action: action),
      );
      final activities = response.map();
      return Right(activities);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<FakePost>>> getPost() async {
    try {
      var responses = await _coreService.getPost();

      return Right(responses.map((response) => response.map()).toList());
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<Activity>>> getActivities({
    int? locationActivityId,
    String sortBy = "action",
    String order = "ASC",
  }) async {
    try {
      var responses = await _coreService.getActivities(
        locationActivityId: locationActivityId,
        sortBy: sortBy,
        order: order,
      );
      var data = responses.data as List<dynamic>;
      var activityResponses = data.map(
        (json) => ActivityResponseData.fromJson(json as Map<String, dynamic>),
      );
      var activities =
          activityResponses.map((response) => response.map()).toList();

      return Right(activities);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<Province>>> getProvinces() async {
    try {
      var responses = await _coreService.getProvinces();
      var data = responses.data as List<dynamic>;
      var provinceResponses = data.map(
        (json) => ProvinceResponse.fromJson(json as Map<String, dynamic>),
      );

      var provinces =
          provinceResponses.map((response) => response.map()).toList();

      return Right(provinces);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<Place>>> getPlaces({
    List<int> provinceIds = const [],
    String sortBy = "Name",
    String order = "ASC",
  }) async {
    try {
      var responses = await _coreService.getPlaces(
        provinceId: provinceIds.join(","),
        sortBy: sortBy,
        order: order,
      );
      var data = responses.data as List<dynamic>;
      var placeResponses = data.map(
        (json) => PlaceResponse.fromJson(json as Map<String, dynamic>),
      );
      var places = placeResponses.map((response) => response.map()).toList();

      return Right(places);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<LocationActivity>>> getLocationActivities({
    required int placeId,
    String sortBy = "Name",
    String order = "ASC",
    String? filter,
  }) async {
    try {
      var responses = await _coreService.getLocationActivity(
        placeId: placeId,
        sortBy: sortBy,
        order: order,
        filter: filter,
      );
      var data = responses.data as List<dynamic>;
      var locationActivityResponses = data.map(
        (json) =>
            LocationActivityResponse.fromJson(json as Map<String, dynamic>),
      );
      var locationActivities =
          locationActivityResponses.map((response) => response.map()).toList();

      return Right(locationActivities);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<Trip>>> getTrips({
    String sortBy = "Title",
    String order = "ASC",
    String? filter,
  }) async {
    try {
      var responses = await _coreService.getTrips(
        sortBy: sortBy,
        order: order,
        filter: filter,
      );
      var data = responses.data as List<dynamic>;
      var tripResponses = data.map(
        (json) => TripManagerResponse.fromJson(json as Map<String, dynamic>),
      );
      var trips = tripResponses.map((response) => response.map()).toList();
      return Right(trips);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, void>> deleteTrip({required int id}) async {
    try {
      await _coreService.deleteTrip(id: id);
      return Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<Assignment>>> getAssignments() async {
    try {
      var responses = await _coreService.getAssignments();
      print('=== DEBUG Assignment Response ===');
      print('Response data: ${responses.data}');

      var data = responses.data as List<dynamic>;
      print('Data length: ${data.length}');

      if (data.isNotEmpty) {
        print('First item: ${data.first}');
      }

      var assignmentResponses = data.map(
        (json) => AssignmentResponse.fromJson(json as Map<String, dynamic>),
      );
      var assignments =
          assignmentResponses.map((response) => response.map()).toList();

      print('Assignments count: ${assignments.length}');
      return Right(assignments);
    } catch (e, stackTrace) {
      print('=== ERROR in getAssignments ===');
      print('Error: $e');
      print('StackTrace: $stackTrace');
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, Trip>> createTour({
    required CTTour tour,
    required List<CTDayOfTour> dayOfTours,
    required List<Either<File, String>> images,
  }) async {
    try {
      var createDayOfTourRequests =
          dayOfTours.map((i) => i.mapToRequest()).toList();
      var createTourRequest = tour.mapToCreateRequest();
      createTourRequest.day = createDayOfTourRequests.length;
      createTourRequest.dayOfTours = createDayOfTourRequests;

      List<Future<String>> futureImages = [];
      List<String> retainImages = [];
      images.forEach((image) {
        image.fold(
          (file) {
            var futureImage = AppEncodeHelper.toBase64String(file);
            futureImages.add(futureImage);
          },
          (url) {
            retainImages.add(url);
          },
        );
      });

      var encodeImages = await Future.wait(futureImages);

      createTourRequest.tourImages = encodeImages;

      //TODO: write api to receive ratainImage and file
      var response = await _coreService.createTour(createTourRequest);
      var json = response.data as Map<String, dynamic>;
      var trip = TripManagerResponse.fromJson(json).map();

      return Right(trip);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, Trip>> updateTour({
    required int id,
    required CTTour tour,
    required List<CTDayOfTour> dayOfTours,
    required List<Either<File, String>> images,
  }) async {
    try {
      var createDayOfTourRequests =
          dayOfTours.map((i) => i.mapToRequest()).toList();

      List<Future<String>> futureImages = [];
      List<String> retainImages = [];
      images.forEach((image) {
        image.fold(
          (file) {
            var futureImage = AppEncodeHelper.toBase64String(file);
            futureImages.add(futureImage);
          },
          (url) {
            retainImages.add(url);
          },
        );
      });

      var encodeImages = await Future.wait(futureImages);

      var updateTourRequest = tour.mapToUpdateRequest();
      updateTourRequest.id = id;
      updateTourRequest.day = createDayOfTourRequests.length;
      updateTourRequest.dayOfTours = createDayOfTourRequests;
      updateTourRequest.tourImages = encodeImages;
      updateTourRequest.retainImages = retainImages;

      var response = await _coreService.updateTour(updateTourRequest);
      var json = response.data as Map<String, dynamic>;
      var trip = TripManagerResponse.fromJson(json).map();

      return Right(trip);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, Place>> updatePlace({
    required int id,
    required String name,
    required int locationId,
  }) async {
    try {
      final body = {"id": id, "name": name, "locationId": locationId};

      final response = await _coreService.updatePlace(body);
      final data = response.data as Map<String, dynamic>;
      final placeResponse = PlaceResponse.fromJson(data);
      return Right(placeResponse.map());
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, Place>> createPlace({
    required String name,
    required int locationId,
  }) async {
    try {
      final body = {"name": name, "locationId": locationId};
      final response = await _coreService.createPlace(body);
      final data = response.data as Map<String, dynamic>;
      final placeResponse = PlaceResponse.fromJson(data);
      return Right(placeResponse.map());
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, Place>> deletePlace({required int id}) async {
    try {
      final response = await _coreService.deletePlace(id);
      final data = response.data as Map<String, dynamic>;
      final placeResponse = PlaceResponse.fromJson(data);
      return Right(placeResponse.map());
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, User>> postLogin({
    required String email,
    required String password,
  }) async {
    try {
      var response = await _coreService.login({
        "email": email,
        "password": password,
      });

      var data = response.data as Map<String, dynamic>;

      var userResponse = UserResponse.fromJson(data);

      var user = userResponse.map();

      return Right(user);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, ScheduleAssignmentTourguide>>
  getScheduleAssignmentById({required int id}) async {
    try {
      var response = await _coreService.getScheduleAssignmentById(id);

      var data = response.data as Map<String, dynamic>;

      var scheduleResponse = ScheduleAssignmentTourguideResponse.fromJson(data);

      var schedule = scheduleResponse.map();

      return Right(schedule);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<TourGuide>>> getTourGuides({
    required int idschedule,
  }) async {
    try {
      var response = await _coreService.getTourGuideAssignmentById(idschedule);

      var data = response.data as List<dynamic>;

      var tourGuideResponses = data.map(
        (json) => TourGuideResponse.fromJson(json as Map<String, dynamic>),
      );

      var tourGuides =
          tourGuideResponses.map((response) => response.map()).toList();

      return Right(tourGuides);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> checkAssignment({
    required int scheduleId,
    required List<TourGuideResponse> tourGuides,
  }) async {
    try {
      var response = await _coreService.checkAssignment(scheduleId, tourGuides);

      if (response.hashCode == 200) {
        return Right(true);
      } else {
        return Left(ErrorHandler.handle("").failure);
      }
    } catch (e, stackTrace) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
