import 'dart:ffi';
import 'package:booking_tour_flutter/data/network/dio/error_handler.dart';
import 'package:booking_tour_flutter/data/network/dio/failure.dart';
import 'package:booking_tour_flutter/data/reponse/location_response.dart';
import 'package:booking_tour_flutter/domain/location.dart';
import 'package:dartz/dartz.dart';

import 'package:booking_tour_flutter/data/network/core_service.dart';
import 'package:booking_tour_flutter/data/reponse/fake_post_response.dart';
import 'package:booking_tour_flutter/domain/fake_post.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class BookingRepository {
  Future<Either<Failure, List<FakePost>>> getPost();
  Future<Either<Failure, List<Location>>> getLocation();
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
  Future<Either<Failure, List<Location>>> getLocation() async {
    try {
      
      var response = await _coreService.getLocations();
      
      return Right(response.map((respons) => respons.map()).toList());
    } catch (e) {
      print("hihi");
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
