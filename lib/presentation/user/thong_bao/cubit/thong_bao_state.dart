import 'package:booking_tour_flutter/domain/notification.dart';

class ThongBaoState {
  final List<Notification> items;
  final bool isLoading;

  const ThongBaoState({
    this.items = const [],
    this.isLoading = true,
  });

  ThongBaoState copyWith({
    List<Notification>? items,
    bool? isLoading,
  }) {
    return ThongBaoState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
