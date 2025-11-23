import 'package:booking_tour_flutter/app/dependency_injection/theme/app_color.dart';
import 'package:flutter/material.dart';

class BookingStatus {
  static const int processingId = 1;
  static const int depositId = 2;
  static const int payId = 3;

  int id;
  String name;

  BookingStatus({required this.id, required this.name});

  factory BookingStatus.empty() {
    return BookingStatus(id: 0, name: "");
  }
}

extension BookingStatusDisplay on BookingStatus {
  String get nameVn {
    switch (id) {
      case BookingStatus.processingId:
        return "Đang xử lý";
      case BookingStatus.depositId:
        return "Đã đặt cọc";
      default:
        return "Đã thanh toán";
    }
  }

  Color get color {
    switch (id) {
      case BookingStatus.processingId:
        return Colors.red;
      case BookingStatus.depositId:
        return Colors.yellow;
      default:
        return Colors.green;
    }
  }

  IconData get icon {
    switch (id) {
      case BookingStatus.processingId:
        return Icons.eco_rounded;
      case BookingStatus.depositId:
        return Icons.error;
      default:
        return Icons.check_box;
    }
  }
}
