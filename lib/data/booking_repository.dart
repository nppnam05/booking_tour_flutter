import 'dart:ffi';
import 'package:booking_tour_flutter/data/network/dio/error_handler.dart';
import 'package:booking_tour_flutter/data/network/dio/failure.dart';
import 'package:dartz/dartz.dart';

import 'package:booking_tour_flutter/data/network/core_service.dart';
import 'package:booking_tour_flutter/data/reponse/fake_post_response.dart';
import 'package:booking_tour_flutter/domain/fake_post.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class BookingRepository {
  Future<Either<Failure, List<FakePost>>> getPost();
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
}
