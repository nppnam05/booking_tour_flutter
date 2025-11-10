import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/domain/notification.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'thong_bao_state.dart';

class ThongBaoCubit extends Cubit<ThongBaoState> {
  static final BookingRepository _repository = getIt<BookingRepository>();

  ThongBaoCubit() : super(const ThongBaoState());

  Future<void> load(int userId) async {
    emit(state.copyWith(isLoading: true));

    final result = await _repository.getNotification(userId);
    result.fold((failure) => emit(state.copyWith(isLoading: false)), (items) {
      emit(state.copyWith(items: items.cast<Notification>(), isLoading: false));
    });
  }
}
