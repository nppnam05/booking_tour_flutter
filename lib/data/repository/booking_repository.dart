import 'package:booking_tour_flutter/data/network/core_service.dart';
import 'package:booking_tour_flutter/data/reponse/activity_response.dart';
import 'package:booking_tour_flutter/domain/requests/activity_request.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../network/dio/error_handler.dart';
import '../network/dio/failure.dart';

abstract class BookingRepository {
  Future<Either<Failure, dynamic>> submitQcTracking(ActivityRequest request);

  //Future<Either<Failure, dynamic>> createAssignment(CreateAssignmentRequest request);
}

@LazySingleton(as: BookingRepository)
class BookingRepositoryImp implements BookingRepository {
  final CoreService _restService;
  BookingRepositoryImp(this._restService);

  @override
  Future<Either<Failure, dynamic>> submitQcTracking(
    ActivityRequest request,
  ) async {
    try {
      final ActivityResponse response = await _restService.getActivities(
        request.action ?? '',
      );
      return Right(response.result?.data?.toDomain() ?? []);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
