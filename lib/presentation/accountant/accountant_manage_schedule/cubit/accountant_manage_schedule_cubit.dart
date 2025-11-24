import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/domain/booking.dart';
import 'package:booking_tour_flutter/domain/booking_status.dart';
import 'package:booking_tour_flutter/domain/schedule_tourmanager.dart';
import 'package:booking_tour_flutter/presentation/accountant/accountant_manage_schedule/cubit/accountant_manage_schedule_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountantManageScheduleCubit extends Cubit<AccountantManageScheduleState> {
  static final bookingRepository = getIt<BookingRepository>();
  AccountantManageScheduleCubit(): super(AccountantManageScheduleState(status: BookingStatus.copyWith(id: 1), scheduleTourmanager: ScheduleTourmanager.empty(), bookingProcessing: [Booking.empty()], bookingDeposit: [Booking.empty()], bookingPay: [Booking.empty()]));

  Future<void> loadData() async{
    var bookings = await bookingRepository.getBookingsByScheduleId(1);

    bookings.fold((failure) {

    }, (bookings){
      var bookingProcessing = bookings.where((e) => e.status.id == BookingStatus.processingId).toList();
      var bookingDeposit = bookings.where((e) => e.status.id == BookingStatus.depositId).toList();
      var bookingPay = bookings.where((e) => e.status.id == BookingStatus.payId).toList();
      
      emit(state.copyWith(scheduleTourmanager: bookings[0].schedule,bookingProcessing: bookingProcessing, bookingdeposit: bookingDeposit, bookingPay: bookingPay));
    });
  }

  List<Booking> getBookingProcessing(){
    return state.bookingProcessing;
  }

  List<Booking> getBookingdeposit(){
    return state.bookingDeposit;
  }

  List<Booking> getBookingPay(){
    return state.bookingPay;
  }

  void setStatus({required BookingStatus status}){
    emit(state.copyWith(status: status));
  }

  BookingStatus getStatus(){
    return state.status;
  }
}