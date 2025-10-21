import 'dart:ffi';
import 'package:booking_tour_flutter/data/network/dio/error_handler.dart';
import 'package:booking_tour_flutter/data/network/dio/failure.dart';
import 'package:booking_tour_flutter/data/reponse/activity_response.dart';
import 'package:booking_tour_flutter/data/reponse/location_activity_response.dart';
import 'package:booking_tour_flutter/data/reponse/place_response.dart';
import 'package:booking_tour_flutter/data/reponse/province_response.dart';
import 'package:booking_tour_flutter/models/activity.dart';
import 'package:booking_tour_flutter/models/location_activity.dart';
import 'package:booking_tour_flutter/models/place.dart';
import 'package:booking_tour_flutter/models/province.dart';
import 'package:dartz/dartz.dart';

import 'package:booking_tour_flutter/data/network/core_service.dart';
import 'package:booking_tour_flutter/data/reponse/fake_post_response.dart';
import 'package:booking_tour_flutter/domain/fake_post.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class BookingRepository {
  Future<Either<Failure, List<FakePost>>> getPost();

  Future<Either<Failure, List<Activity>>> getActivities({
    String sortBy = "action",
    String order = "ASC",
  });

  Future<Either<Failure, List<Province>>> getProvinces();

  Future<Either<Failure, List<Place>>> getPlaces({
    required int provinceId,
    String sortBy = "Name",
    String order = "ASC",
  });

  Future<Either<Failure, List<LocationActivity>>> getLocationActivities({
    required int placeId,
    String sortBy = "Name",
    String order = "ASC",
    String? filter,
  });
}

@Singleton(as: BookingRepository)
class BookingRepositoryImp implements BookingRepository {
  final CoreService _coreService;

  BookingRepositoryImp(this._coreService);

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
    String sortBy = "action",
    String order = "ASC",
  }) async {
    try {
      var responses = await _coreService.getActivities(
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
    required int provinceId,
    String sortBy = "Name",
    String order = "ASC",
  }) async {
    try {
      var responses = await _coreService.getPlaces(
        provinceId: provinceId,
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
}
