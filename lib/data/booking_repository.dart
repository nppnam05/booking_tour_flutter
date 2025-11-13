import 'dart:async';
import 'dart:io';
import 'package:booking_tour_flutter/app/app_encode_helper.dart';
import 'package:booking_tour_flutter/data/network/dio/error_handler.dart';
import 'package:booking_tour_flutter/data/network/dio/failure.dart';
import 'package:booking_tour_flutter/data/request/booking/booking_schedule_request.dart';
import 'package:booking_tour_flutter/data/request/booking/change_booking_request.dart';
import 'package:booking_tour_flutter/data/request/change_password_request.dart';
import 'package:booking_tour_flutter/data/request/check_account_request.dart';
import 'package:booking_tour_flutter/data/request/create_review_request.dart';
import 'package:booking_tour_flutter/data/request/create_user_request.dart';
import 'package:booking_tour_flutter/data/request/tour_guide/tour_guide_response.dart';
import 'package:booking_tour_flutter/data/request/user/get_helpfull_request.dart';
import 'package:booking_tour_flutter/data/request/user/update_password_request.dart';
import 'package:booking_tour_flutter/data/request/verify_otp_request.dart';
import 'package:booking_tour_flutter/data/request/user/get_reviews_request.dart';
import 'package:booking_tour_flutter/data/response/activity_response.dart';
import 'package:booking_tour_flutter/data/response/assignment_response.dart';
import 'package:booking_tour_flutter/data/response/add_activity_response.dart';
import 'package:booking_tour_flutter/data/response/bank_response.dart';
import 'package:booking_tour_flutter/data/response/booking_response.dart';
import 'package:booking_tour_flutter/data/response/helpfull_response.dart';
import 'package:booking_tour_flutter/data/response/location_activity_response.dart';
import 'package:booking_tour_flutter/data/response/notification_response.dart';
import 'package:booking_tour_flutter/data/response/participant_response.dart';
import 'package:booking_tour_flutter/data/response/pay_booking_response.dart';
import 'package:booking_tour_flutter/data/response/place_response.dart';
import 'package:booking_tour_flutter/data/response/province_response.dart';
import 'package:booking_tour_flutter/data/response/review_response.dart';
import 'package:booking_tour_flutter/data/response/schedule_assignment_response.dart';
import 'package:booking_tour_flutter/data/response/schedule_assignment_tourguide_response.dart';
import 'package:booking_tour_flutter/data/response/schedule_book_response.dart';
import 'package:booking_tour_flutter/data/response/schedule_detail_response.dart'
    hide LocationActivityResponse;
import 'package:booking_tour_flutter/data/response/schedule_tourguide_response.dart';
import 'package:booking_tour_flutter/data/response/schedule_tourmanager_response.dart'
    hide ProvinceResponse;
import 'package:booking_tour_flutter/data/response/schedule_user_completed_response.dart';
import 'package:booking_tour_flutter/data/response/tour_assignment_response.dart';
import 'package:booking_tour_flutter/data/response/user_response.dart';
import 'package:booking_tour_flutter/data/response/trip_manager_response.dart';
import 'package:booking_tour_flutter/data/response/put_activity_response.dart';
import 'package:booking_tour_flutter/data/response/update_location_activities_response.dart';
import 'package:booking_tour_flutter/domain/activity.dart';
import 'package:booking_tour_flutter/domain/bank.dart';
import 'package:booking_tour_flutter/domain/booking.dart';
import 'package:booking_tour_flutter/domain/create_tour/CT_day_of_tour.dart';
import 'package:booking_tour_flutter/domain/create_tour/CT_tour.dart';
import 'package:booking_tour_flutter/domain/assignment.dart';
import 'package:booking_tour_flutter/domain/helpful.dart';
import 'package:booking_tour_flutter/domain/location_activity.dart';
import 'package:booking_tour_flutter/domain/participants.dart';
import 'package:booking_tour_flutter/domain/pay_booking.dart';
import 'package:booking_tour_flutter/domain/place.dart';
import 'package:booking_tour_flutter/domain/province.dart';
import 'package:booking_tour_flutter/domain/requests/add_schedule_request.dart';
import 'package:booking_tour_flutter/domain/requests/update_schedule_request.dart';
import 'package:booking_tour_flutter/domain/review.dart';
import 'package:booking_tour_flutter/domain/schedule_assignment.dart';
import 'package:booking_tour_flutter/domain/schedule_book.dart';
import 'package:booking_tour_flutter/domain/schedule_detail.dart'
    hide Activity, LocationActivity;
import 'package:booking_tour_flutter/domain/schedule_tourguide.dart';
import 'package:booking_tour_flutter/domain/schedule_tourmanager.dart';
import 'package:booking_tour_flutter/domain/schedule_user_completed.dart';
import 'package:booking_tour_flutter/domain/tour_assignment.dart';
import 'package:booking_tour_flutter/domain/trip.dart';
import 'package:booking_tour_flutter/domain/schedule_assignment_tourguide.dart';
import 'package:booking_tour_flutter/domain/tour_guide.dart';
import 'package:booking_tour_flutter/domain/user.dart';
import 'package:booking_tour_flutter/domain/requests/add_activity_request.dart';
import 'package:booking_tour_flutter/domain/requests/add_location_activity_request.dart';
import 'package:booking_tour_flutter/domain/requests/fix_activity_request.dart';
import 'package:booking_tour_flutter/domain/requests/update_location_activities.dart';
import 'package:dartz/dartz.dart';
import 'package:booking_tour_flutter/data/response/favorite_response.dart';
import 'package:booking_tour_flutter/domain/favorite.dart';
import 'package:booking_tour_flutter/data/network/core_service.dart';
import 'package:booking_tour_flutter/data/response/fake_post_response.dart';
import 'package:booking_tour_flutter/domain/fake_post.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class BookingRepository {
  Future<Either<Failure, bool>> removeFavorite({
    required int tourId,
    required int userId,
  });

  Future<Either<Failure, List<Favorite>>> getTourFavoriteByUserId({
    required int userId,
  });

  Future<Either<Failure, PayBooking>> getBookingById({required int id});

  Future<Either<Failure, int>> createBooking({
    required BookingScheduleRequest booking,
  });

  Future<Either<Failure, List<Bank>>> getBank();

  Future<Either<Failure, List<FakePost>>> getPost();

  Future<Either<Failure, ScheduleBook>> getScheduleBookById(int id);

  Future<Either<Failure, ScheduleDetail>> getScheduleById(int id);

  Future<Either<Failure, bool>> changePassword(
    ChangePasswordRequest changePassword,
  );

  Future<Either<Failure, bool>> verifyOTP(VerifyOtpRequest verifyOtp);

  Future<Either<Failure, bool>> sendOTP(String email);

  Future<Either<Failure, List<bool>>> checkAccount({
    required CheckAccountRequest checkAccount,
  });

  Future<Either<Failure, bool>> registerUser({
    required CreateUserRequest createUser,
  });

  Future<Either<Failure, User>> getUserById({required int id});

  Future<Either<Failure, List<ScheduleTourmanager>>>
  getScheduleUserCompletedByUserId({required int userId});

  Future<Either<Failure, bool>> checkAssignment({
    required int scheduleId,
    required List<TourGuideResponse> tourGuides,
  });

  Future<Either<Failure, List<TourGuide>>> getTourGuides({
    required int idschedule,
  });

  Future<Either<Failure, ScheduleAssignmentTourguide>>
  getScheduleAssignmentById({required int idSchedule});

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
    int? provinceId,
    DateTime? startDate,
    DateTime? endDate,
    int? stars,
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

  Future<Either<Failure, User>> updateUserId({
    required final int id,
    required final String bank,
    required final String avatarPath,
    required final String bankBranch,
    required final String bankNumber,
    final int money,
    final String name,
    final String email,
    final String phone,
    final bool refundStatus
  });

  Future<Either<Failure, Place>> createPlace({
    required String name,
    required int locationId,
  });

  Future<Either<Failure, Place>> deletePlace({required int id});

  Future<Either<Failure, List<Activity>>> postActivity(String action);
  Future<Either<Failure, List<Activity>>> putActivity(int id, String action);
  Future<Either<Failure, bool>> deleteActivity(int id);
  Future<Either<Failure, LocationActivityResponse>> addLocationActivities(
    AddLocationActivityRequest request,
  );
  Future<Either<Failure, UpdateLocationActivitiesResponse>>
  updateLocationActivities(UpdateLocationActivities request);
  Future<Either<Failure, int>> addSchedule(AddScheduleRequest request);
  Future<Either<Failure, bool>> updateSchedule(UpdateScheduleRequest request);
  Future<Either<Failure, List<ScheduleTourmanager>>> getAllSchedule();
  Future<Either<Failure, List<ScheduleTourmanager>>> getSchedulesByTourId(
    int tourId,
  );
  Future<Either<Failure, void>> deleteScheduleById({required int id});
  Future<Either<Failure, List<Participant>>> getParticipantsByScheduleId({
    required int scheduleId,
  });
  Future<Either<Failure, List<ScheduleTourguide>>> getSchedulesByStaff({
    required int staffId,
  });

  Future<Either<Failure, TourAssignment>> getTourAssignmentByTourId({
    required int tourId,
  });

  Future<Either<Failure, List<ScheduleAssignment>>>
  getScheduleAssignmentsByTourId({required int tourId});
  Future<Either<Failure, LocationActivityResponse>> deleteLocatinActivities(
    int id,
  );

  Future<Either<Failure, List<Booking>>> getBookingByUserId({
    required int userId,
  });
  Future<Either<Failure, Booking>> changeBookingTour({
    required int bookingId,
    required int scheduleId,
  });

  Future<Either<Failure, Booking>> deleteBooking(int bookingId);

  Future<Either<Failure, void>> createReview({
    required int userId,
    required int scheduleId,
    required String content,
    required int rating,
  });

  Future<Either<Failure, List<Trip>>> getMostFavoriteTour();
  Future<Either<Failure, List<Trip>>> getMostRecent();
  Future<Either<Failure, List<Notification>>> getNotification(int userId);
  Future<Either<Failure, void>> updatePasswordUserById({
    required int userId,
    required String oldPassword,
    required String newPassword,
  });
  Future<Either<Failure, List<Review>>> getReview(GetReviewsRequest request);
  Future<Either<Failure, List<Helpful>>> getHelpFul(GetHelpFullRequest request);
  Future<Either<Failure, int>> postFavorite(GetReviewsRequest request);
}

@Singleton(as: BookingRepository)
class BookingRepositoryImp implements BookingRepository {
  final CoreService _coreService;

  BookingRepositoryImp(this._coreService);

  @override
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
  Future<Either<Failure, LocationActivityResponse>> addLocationActivities(
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
    int? provinceId,
    DateTime? startDate,
    DateTime? endDate,
    int? stars,
  }) async {
    try {
      var responses = await _coreService.getTrips(
        sortBy: sortBy,
        order: order,
        filter: filter?.isNotEmpty == true ? filter : null,
        provinceId: provinceId,
        startDate: startDate,
        endDate: endDate,
        stars: stars,
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

      var data = responses.data as List<dynamic>;

      var assignmentResponses = data.map(
        (json) => AssignmentResponse.fromJson(json as Map<String, dynamic>),
      );
      var assignments =
          assignmentResponses.map((response) => response.map()).toList();

      return Right(assignments);
    } catch (e) {
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
      for (var image in images) {
        image.fold(
          (file) {
            var futureImage = AppEncodeHelper.toBase64String(file);
            futureImages.add(futureImage);
          },
          (url) {
            retainImages.add(url);
          },
        );
      }

      var encodeImages = await Future.wait(futureImages);

      createTourRequest.tourImages = encodeImages;

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
      for (var image in images) {
        image.fold(
          (file) {
            var futureImage = AppEncodeHelper.toBase64String(file);
            futureImages.add(futureImage);
          },
          (url) {
            retainImages.add(url);
          },
        );
      }

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
  getScheduleAssignmentById({required int idSchedule}) async {
    try {
      var response = await _coreService.getScheduleAssignmentById(idSchedule);

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

      return Right(response.data as bool);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, int>> addSchedule(AddScheduleRequest request) async {
    try {
      var response = await _coreService.createSchedule(request);
      return Right(response.data);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> updateSchedule(
    UpdateScheduleRequest request,
  ) async {
    try {
      var response = await _coreService.updateSchedule(request);
      final success =
          (response.data is bool)
              ? response.data as bool
              : (response.data == true);
      return Right(success);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<ScheduleTourmanager>>> getAllSchedule() async {
    try {
      final response = await _coreService.getAllSchedules();
      final data = response.data as List<dynamic>;

      final schedules =
          data
              .map(
                (json) =>
                    ScheduleTourmanagerResponse.fromJson(
                      json as Map<String, dynamic>,
                    ).map(),
              )
              .toList();

      return Right(schedules);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<ScheduleTourmanager>>> getSchedulesByTourId(
    int tourId,
  ) async {
    try {
      final response = await _coreService.getSchedulesByTourId(tourId: tourId);
      final data = response.data as List<dynamic>;

      final schedules =
          data
              .map(
                (json) =>
                    ScheduleTourmanagerResponse.fromJson(
                      json as Map<String, dynamic>,
                    ).map(),
              )
              .toList();

      return Right(schedules);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, void>> deleteScheduleById({required int id}) async {
    try {
      await _coreService.deleteScheduleById(id: id);
      return const Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<Participant>>> getParticipantsByScheduleId({
    required int scheduleId,
  }) async {
    try {
      var response = await _coreService.getUserCompletedSchedule(
        scheduleId: scheduleId,
      );

      var data = response.data as List<dynamic>;
      var scheduleResponses = data.map(
        (json) => UserCompletedScheduleResponse.fromJson(
          json as Map<String, dynamic>,
        ),
      );

      List<Participant> allParticipants = [];
      for (var scheduleResponse in scheduleResponses) {
        allParticipants.addAll(scheduleResponse.mapToParticipants());
      }

      return Right(allParticipants);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<ScheduleTourguide>>> getSchedulesByStaff({
    required int staffId,
  }) async {
    try {
      var responses = await _coreService.getGuidesByStaff(staffId: staffId);
      var data = responses.data as List<dynamic>;

      var scheduleResponses = data.map(
        (json) =>
            ScheduleTourguideResponse.fromJson(json as Map<String, dynamic>),
      );
      var schedules =
          scheduleResponses.map((response) => response.map()).toList();

      return Right(schedules);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, TourAssignment>> getTourAssignmentByTourId({
    required int tourId,
  }) async {
    try {
      var response = await _coreService.getTourAssignmentByTourId(tourId);

      var data = response.data as Map<String, dynamic>;

      var tourAssignmentResponse = TourAssignmentResponse.fromJson(data);

      var tourAssignment = tourAssignmentResponse.map();

      return Right(tourAssignment);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<ScheduleAssignment>>>
  getScheduleAssignmentsByTourId({required int tourId}) async {
    try {
      var responses = await _coreService.getScheduleAssignments(tourId);

      var data = responses.data as List<dynamic>;

      var scheduleAssignmentResponses = data.map(
        (json) =>
            ScheduleAssignmentResponse.fromJson(json as Map<String, dynamic>),
      );

      var scheduleAssignments =
          scheduleAssignmentResponses
              .map((response) => response.map())
              .toList();

      return Right(scheduleAssignments);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, LocationActivityResponse>> deleteLocatinActivities(
    int id,
  ) async {
    try {
      final response = await _coreService.deleteLocationActivities(id: id);
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<Favorite>>> getTourFavoriteByUserId({
    required int userId,
  }) async {
    try {
      final responses = await _coreService.getTourFavoriteByUserId(userId);

      final jsonData = responses.data;
      final List<dynamic> data =
          (jsonData is Map<String, dynamic>)
              ? (jsonData['data'] as List<dynamic>)
              : (jsonData as List<dynamic>);

      final favorites =
          data
              .map(
                (json) =>
                    FavoriteResponse.fromJson(
                      json as Map<String, dynamic>,
                    ).map(),
              )
              .toList();

      return Right(favorites);
    } catch (e, st) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> removeFavorite({
    required int tourId,
    required int userId,
  }) async {
    try {
      await _coreService.removeFavorite(tourId, userId);
      return const Right(true);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<Booking>>> getBookingByUserId({
    required int userId,
  }) async {
    try {
      var responses = await _coreService.getBookingByUserId(userId);

      var data = responses.data as List<dynamic>;

      var bookingResponse = data.map(
        (json) => BookingResponse.fromJson(json as Map<String, dynamic>),
      );

      var bookings = bookingResponse.map((response) => response.map()).toList();

      return Right(bookings);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, Booking>> changeBookingTour({
    required int bookingId,
    required int scheduleId,
  }) async {
    try {
      var changeBookingRequest = ChangeBookingRequest(
        scheduleId: scheduleId,
        bookingId: bookingId,
      );
      var responses = await _coreService.changeBooking(changeBookingRequest);

      var data = responses.data as Map<String, dynamic>;

      var result = BookingResponse.fromJson(data);

      return Right(result.map());
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, Booking>> deleteBooking(int bookingId) async {
    try {
      var responses = await _coreService.deleteBooking(bookingId);

      var data = responses.data as Map<String, dynamic>;

      var result = BookingResponse.fromJson(data);

      return Right(result.map());
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> createReview({
    required int userId,
    required int scheduleId,
    required String content,
    required int rating,
  }) async {
    try {
      var createReviewRequest = CreateReviewRequest(
        userId: userId,
        scheduleId: scheduleId,
        content: content,
        rating: rating,
      );
      var responses = await _coreService.createReview(createReviewRequest);

      // var data = responses.data as Map<String, dynamic>;

      // var result = BookingResponse.fromJson(data);

      return Right(true);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<Trip>>> getMostFavoriteTour() async {
    try {
      final responses = await _coreService.getMostFavoriteTour();
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
  Future<Either<Failure, List<Trip>>> getMostRecent() async {
    try {
      final responses = await _coreService.getMostFavoriteTour();
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
  Future<Either<Failure, List<Notification>>> getNotification(
    int userId,
  ) async {
    try {
      final responses = await _coreService.getNotification(userId);
      final data = responses.data as List<dynamic>;
      final items =
          data
              .map(
                (json) =>
                    NotificationResponse.fromJson(
                      json as Map<String, dynamic>,
                    ).map(),
              )
              .toList()
              .cast<Notification>();

      return Right(items);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<Review>>> getReview(
    GetReviewsRequest request,
  ) async {
    try {
      final responses = await _coreService.getReview(request);
      final data = responses.data as List<dynamic>;
      final items =
          data
              .map(
                (json) =>
                    ReviewResponse.fromJson(json as Map<String, dynamic>).map(),
              )
              .toList();

      return Right(items);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> registerUser({
    required CreateUserRequest createUser,
  }) async {
    try {
      var user = createUser.toJson();

      var response = await _coreService.registerUser(user);

      return Right(true);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, User>> getUserById({required int id}) async {
    try {
      var responses = await _coreService.getUserById(id);
      var data = responses.data as Map<String, dynamic>;

      var userResponse = UserResponse.fromJson(data);

      var user = userResponse.map();

      return Right(user);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, User>> updateUserId({
    required int id,
    int? money,
    String? name,
    String? email,
    String? phone,
    String? bank,
    String? avatarPath,
    String? bankBranch,
    String? bankNumber,
    bool? refundStatus
  }) async {
    try {
      final body = {
        "id": id,
        "money": money,
        "name": name,
        "email": email,
        "phone": phone,
        "bank": bank,
        "avatarPath": avatarPath,
        "bankBranch": bankBranch,
        "bankNumber": bankNumber,
        "refundStatus": refundStatus,
      };

      final response = await _coreService.updateUserId(body);

      final data = response.data as Map<String, dynamic>;

      final userResponse = UserResponse.fromJson(data);
      return Right(userResponse.map());
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<Bank>>> getBank() async {
    try {
      var responses = await _coreService.getBank();
      var data = responses.data as List<dynamic>;

      var bankResponses = data.map(
        (e) => BankResponse.fromJson(e as Map<String, dynamic>),
      );
      var banks = bankResponses.map((e) => e.map()).toList();
      return Right(banks);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<ScheduleTourmanager>>>
  getScheduleUserCompletedByUserId({required int userId}) async {
    try {
      var responses = await _coreService.getScheduleCompletedByUserId(userId);
      var data = responses.data as List<dynamic>;

      var scheduleRPs = data.map(
        (e) =>
            ScheduleTourmanagerResponse.fromJson(e as Map<String, dynamic>),
      );
      var schedules = scheduleRPs.map((e) => e.map()).toList();
      return Right(schedules);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<bool>>> checkAccount({
    required CheckAccountRequest checkAccount,
  }) async {
    try {
      final jsonData = checkAccount.toJson();

      var responses = await _coreService.checkAccount(jsonData);

      var data = responses.data as List<dynamic>;

      var result = data.map((e) => e as bool).toList();

      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> sendOTP(String email) async {
    try {
      var response = await _coreService.sendOTP({"email": email});

      var data = response.data as bool;

      return Right(data);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> verifyOTP(VerifyOtpRequest verifyOtp) async {
    try {
      var response = await _coreService.verifyOTP(verifyOtp.toJson());

      var data = response.data as bool;

      return Right(data);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> changePassword(
    ChangePasswordRequest changePassword,
  ) async {
    try {
      var response = await _coreService.changePassword(changePassword.toJson());

      var data = response.data as bool;

      return Right(data);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, ScheduleDetail>> getScheduleById(int id) async {
    try {
      var response = await _coreService.getScheduleById(id);

      var data = response.data as Map<String, dynamic>;

      var result = ScheduleDetailResponse.fromJson(data);

      var schedule = result.map();

      return Right(schedule);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, ScheduleBook>> getScheduleBookById(int id) async {
    try {
      var response = await _coreService.getScheduleById(id);

      var data = response.data as Map<String, dynamic>;

      var result = ScheduleBookResponse.fromJson(data);

      var schedule = result.map();

      return Right(schedule);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, int>> createBooking({
    required BookingScheduleRequest booking,
  }) async {
    try {
      var response = await _coreService.createBooking(booking);

      return Right(response.data as int);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, PayBooking>> getBookingById({required int id}) async {
    try {
      var response = await _coreService.getBookingById(id);

      var data = response.data as Map<String, dynamic>;

      var result = PayBookingResponse.fromJson(data);

      var payBooking = result.map();

      return Right(payBooking);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

 @override
Future<Either<Failure, void>> updatePasswordUserById({
  required int userId,
  required String oldPassword,
  required String newPassword,
}) async {
  try {
    final request = UpdatePasswordRequest(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
    final response = await _coreService.updatePassword(userId, request);
    if (response.data == true) {
      return Right(null);
    } else {
     
      return Left(Failure(
        code: 400,
        message: "Mật khẩu cũ không đúng ! ",
      ));
    }
  } catch (e) {
    return Left(ErrorHandler.handle(e).failure);
  }
}

  @override
  Future<Either<Failure, List<Helpful>>> getHelpFul(
    GetHelpFullRequest request,
  ) async {
    try {
      final response = await _coreService.getHelpFul(request);
      final data = response.data as List<dynamic>;
      final items =
          data
              .map(
                (json) =>
                    HelpfullResponse.fromJson(
                      json as Map<String, dynamic>,
                    ).toEntity(),
              )
              .toList();

      return Right(items);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, int>> postFavorite(GetReviewsRequest request) async {
    try {
      final response = await _coreService.postFavorite(request);
      final data = response.data as int;
      return Right(data);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
