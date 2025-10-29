import 'package:booking_tour_flutter/data/request/tour/create_tour_request.dart';
import 'package:booking_tour_flutter/data/request/tour/update_tour_request.dart';
import 'package:booking_tour_flutter/data/response/add_activity_response.dart';
import 'package:booking_tour_flutter/data/response/assignment_response.dart';
import 'package:booking_tour_flutter/data/response/delete_activity_response.dart';
import 'package:booking_tour_flutter/data/response/fake_post_response.dart';
import 'package:booking_tour_flutter/data/response/location_activity_response.dart';
import 'package:booking_tour_flutter/data/response/put_activity_response.dart';
import 'package:booking_tour_flutter/data/response/rest_response.dart';
import 'package:booking_tour_flutter/data/request/tour_guide/tour_guide_response.dart';
import 'package:booking_tour_flutter/data/response/update_location_activities_response.dart';
import 'package:booking_tour_flutter/domain/requests/add_activity_request.dart';
import 'package:booking_tour_flutter/domain/requests/add_location_activity_request.dart';
import 'package:booking_tour_flutter/domain/requests/add_schedule_request.dart';
import 'package:booking_tour_flutter/domain/requests/fix_activity_request.dart';
import 'package:booking_tour_flutter/domain/requests/update_location_activities.dart';
import 'package:booking_tour_flutter/domain/requests/update_schedule_request.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'core_service.g.dart';

@injectable
@RestApi()
abstract class CoreService {
  @factoryMethod
  factory CoreService(Dio dio) = _CoreService;

  @GET("/Schedule/assignment/{tourId}")
  Future<RestResponse> getScheduleAssignments(@Path("tourId") int tourId);

  @GET("/Tour/{tourId}")
  Future<RestResponse> getTourAssignmentByTourId(@Path("tourId") int tourId);

  @POST("/Guide/{scheduleId}")
  Future<RestResponse> checkAssignment(
    @Path("scheduleId") int scheduleId,
    @Body() List<TourGuideResponse> body,
  );

  @GET("/Guide/BySchedule/{idschedule}")
  Future<RestResponse> getTourGuideAssignmentByScheduleId(
    @Path("idschedule") int idschedule,
  );

  @GET("/Staff/tourguide/assignment/{idschedule}")
  Future<RestResponse> getTourGuideAssignmentById(
    @Path("idschedule") int idschedule,
  );

  @GET("/Schedule/{id}")
  Future<RestResponse> getScheduleAssignmentById(@Path("id") int id);

  @POST("/Schedule")
  Future<RestResponse> createSchedule(@Body() AddScheduleRequest request);

  @PUT("/Schedule")
  Future<RestResponse> updateSchedule(@Body() UpdateScheduleRequest request);

  @GET("/Schedule")
  Future<RestResponse> getAllSchedules();

  @DELETE("/Schedule/{id}")
  Future<RestResponse> deleteScheduleById({@Path("id") required int id});

  @POST("/User/Login")
  Future<RestResponse> login(@Body() Map<String, dynamic> body);

  @GET("/posts")
  Future<List<FakePostResponse>> getPost();

  @GET("/Activity")
  Future<RestResponse> getActivities({
    @Query("locationActivityId") int? locationActivityId,
    @Query("orderBy") String sortBy = "Action",
    @Query("sortBy") String order = "ASC",
  });

  @POST("/Activity")
  Future<AddActivityResponse> addActivity(@Body() AddActivityRequest request);

  @PUT("/Activity")
  Future<PutActivityResponse> updateActivity(
    @Body() FixActivityRequest request,
  );

  @DELETE("/Activity/{id}")
  Future<DeleteActivityResponse> deleteActivity(@Path("id") int id);

  @GET("/Location")
  Future<RestResponse> getProvinces();

  @GET("/Place")
  Future<RestResponse> getPlaces({
    @Query("locationIds") required String provinceId,
    @Query("orderBy") String sortBy = "Name",
    @Query("sortBy") String order = "ASC",
  });

  @GET("/LocationActivity")
  Future<RestResponse> getLocationActivity({
    @Query("placeId") required int placeId,
    @Query("orderBy") String sortBy = "Name",
    @Query("sortBy") String order = "ASC",
    @Query("filter") String? filter,
  });
  @GET("/Tour")
  Future<RestResponse> getTrips({
    @Query("SortBy") String sortBy = "Title",
    @Query("SortOrder") String order = "ASC",
    @Query("filter") String? filter,
  });
  @DELETE("/Tour/{id}")
  Future<void> deleteTrip({@Path("id") required int id});

  @GET("/Tour")
  Future<RestResponse> getAssignments({
    @Query("sortBy") String sortBy = "Title",
    @Query("orderBy") String order = "ASC",
    @Query("filter") String? filter,
  });

  @GET("/Guide/schedule/{staffId}")
  Future<RestResponse> getGuidesByStaff({
    @Path("staffId") required int staffId,
  });

  @GET("/UserCompletedSchedule/{scheduleId}")
  Future<RestResponse> getUserCompletedSchedule({
    @Path("scheduleId") required int scheduleId,
  });

  @POST("/Tour")
  Future<RestResponse> createTour(@Body() CreateTourRequest request);

  @PUT("/Tour")
  Future<RestResponse> updateTour(@Body() UpdateTourRequest request);

  // PUT
  @PUT("/Place")
  Future<RestResponse> updatePlace(@Body() Map<String, dynamic> body);

  // POST
  @POST("/Place")
  Future<RestResponse> createPlace(@Body() Map<String, dynamic> body);

  // DELETE
  @DELETE("/Place/{id}")
  Future<RestResponse> deletePlace(@Path("id") int placeId);

  @POST("/LocationActivity")
  Future<LocationActivityResponse> addLocationActivities(
    @Body() AddLocationActivityRequest request,
  );

  @PUT("/LocationActivity")
  Future<UpdateLocationActivitiesResponse> updateLocationActivities(
    @Body() UpdateLocationActivities request,
  );

  @POST("/Place")
  Future<AssignmentPlaceResponse> addPlace(
    @Body() Map<String, dynamic> request,
  );
}
