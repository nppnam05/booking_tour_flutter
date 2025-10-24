import 'package:booking_tour_flutter/data/response/activity_response.dart';
import 'package:booking_tour_flutter/data/response/fake_post_response.dart';
import 'package:booking_tour_flutter/data/response/place_response.dart';
import 'package:booking_tour_flutter/data/response/rest_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'core_service.g.dart';

@injectable
@RestApi()
abstract class CoreService {
  @factoryMethod
  factory CoreService(Dio dio) = _CoreService;

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
  @GET("/Tour")
  Future<RestResponse> getTrips({
    @Query("sortBy") String sortBy = "Title",
    @Query("orderBy") String order = "ASC",
    @Query("filter") String? filter,
  });
  @DELETE("/Tour/{id}")
  Future<void> deleteTrip({
    @Path("id")  required int  id ,
  });
}
