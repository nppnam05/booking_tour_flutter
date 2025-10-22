import 'package:booking_tour_flutter/data/network/dio/failure.dart';
import 'package:dio/dio.dart';

class ErrorHandler {
  late Failure failure;

  ErrorHandler.handle(Object e) {
    if (e is DioException) {
      failure = Failure(code: -1, message: "have error");
    } else {
      failure = Failure(code: -1, message: "have error");
    }
  }
}
