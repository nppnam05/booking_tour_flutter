import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/domain/location.dart';
import 'package:booking_tour_flutter/presentation/tour_manager/dia_danh/cubit/dia_danh_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiaDanhCubit extends Cubit<DiaDanhState> {
  static final bookingRepository = getIt<BookingRepository>();
  DiaDanhCubit() : super(DiaDanhState(locations: []));

  Future<void> syncLocation() async {
    var result = await bookingRepository.getLocation();
    
    result.fold((failure) {}, (location){
      emit(state.copyWith(location: location));
    });
  }
  void selectLocation(Location? location) {
    emit(state.copyWith(selectedLocation: location));
  }
}