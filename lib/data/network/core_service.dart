import 'package:booking_tour_flutter/data/response/activity_response.dart';
import 'package:booking_tour_flutter/data/response/fake_post_response.dart';
import 'package:booking_tour_flutter/data/response/place_response.dart';
import 'package:booking_tour_flutter/data/response/rest_response.dart';
import 'package:booking_tour_flutter/data/response/tour_guide_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'core_service.g.dart';

@injectable
@RestApi()
abstract class CoreService {
  @factoryMethod
  factory CoreService(Dio dio) = _CoreService;

  @POST("/Guide/{scheduleId}")
  Future<RestResponse> checkAssignment(@Path("scheduleId") int scheduleId, @Body() List<TourGuideResponse> body);

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

  // PUT
  @PUT("/Place")
  Future<RestResponse> updatePlace(
    @Body() Map<String, dynamic> body,
  );

  // POST
  @POST("/Place")
  Future<RestResponse> createPlace(
    @Body() Map<String, dynamic> body,
  );
  
  // DELETE
  @DELETE("/Place/{id}")
  Future<RestResponse> deletePlace(@Path("id") int placeId);
}
