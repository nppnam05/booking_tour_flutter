import 'dart:ffi';
import 'package:booking_tour_flutter/data/network/dio/error_handler.dart';
import 'package:booking_tour_flutter/data/network/dio/failure.dart';
import 'package:booking_tour_flutter/data/reponse/activity_response.dart';
import 'package:booking_tour_flutter/models/activity.dart';
import 'package:dartz/dartz.dart';

import 'package:booking_tour_flutter/data/network/core_service.dart';
import 'package:booking_tour_flutter/data/reponse/fake_post_response.dart';
import 'package:booking_tour_flutter/domain/fake_post.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class BookingRepository {
  Future<Either<Failure, List<FakePost>>> getPost();

  Future<Either<Failure, List<Activity>>> getActivities();
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
  Future<Either<Failure, List<Activity>>> getActivities() async {
    try {
      var responses = await _coreService.getActivities();
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
}
