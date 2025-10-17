import 'package:flutter/material.dart';
import 'generic_selection_dialog.dart';
import 'dialog_noti.dart';


class DialogExamples {
  
  
  static Future<void> testStringSelection(BuildContext context) async {
    final activities = ['Tắm biển', 'Leo núi', 'Tham quan', 'Nghỉ ngơi'];
    final preSelected = ['Tắm biển', 'Leo núi']; // Pre-selected như trong hình
    
    final selected = await GenericSelectionDialog.showMultiSelection<String>(
      context: context,
      title: 'Chọn hoạt động',
      items: activities,
      display: (activity) => activity,
      searchHint: 'Tìm địa điểm',
      preSelectedItems: preSelected,
    );
    
    if (selected != null && selected.isNotEmpty) {
      DialogNoti.showSuccess(
        context: context,
        title: 'Thành công',
        message: 'Bạn đã chọn: ${selected.join(', ')}',
      );
    }
  }

  /// Test với custom object
  static Future<void> testCustomObjectSelection(BuildContext context) async {
    final activities = [
      Activity(id: 1, name: 'Tắm biển', description: 'Thư giãn trên bãi biển'),
      Activity(id: 2, name: 'Leo núi', description: 'Thử thách bản thân'),
      Activity(id: 3, name: 'Tham quan', description: 'Khám phá văn hóa'),
      Activity(id: 4, name: 'Nghỉ ngơi', description: 'Thư giãn tại resort'),
      Activity(id: 5, name: 'Ẩm thực', description: 'Thưởng thức món ngon'),
    ];
    
    final selected = await GenericSelectionDialog.showSingleSelection<Activity>(
      context: context,
      title: 'Chọn hoạt động du lịch',
      items: activities,
      display: (activity) => '${activity.name} - ${activity.description}',
      searchHint: 'Tìm hoạt động...',
    );
    
    if (selected != null) {
      DialogNoti.showInfo(
        context: context,
        title: 'Hoạt động đã chọn',
        message: '${selected.name}: ${selected.description}',
      );
    }
  }

  /// Test các loại dialog thông báo
  static Future<void> testNotificationDialogs(BuildContext context) async {
    // Test dialog thông tin
    await DialogNoti.showInfo(
      context: context,
      title: 'Thông tin',
      message: 'Đây là dialog thông tin',
    );

    // Test dialog thành công
    await DialogNoti.showSuccess(
      context: context,
      title: 'Thành công',
      message: 'Thao tác đã hoàn thành thành công!',
    );

    // Test dialog lỗi
    await DialogNoti.showError(
      context: context,
      title: 'Lỗi',
      message: 'Đã xảy ra lỗi trong quá trình xử lý',
    );

    // Test dialog cảnh báo
    final result = await DialogNoti.showWarning(
      context: context,
      title: 'Cảnh báo',
      message: 'Bạn có chắc chắn muốn tiếp tục?',
    );

    if (result == true) {
      DialogNoti.showSuccess(
        context: context,
        title: 'Xác nhận',
        message: 'Bạn đã chọn tiếp tục',
      );
    }
  }
}

// Custom class để test
class Activity {
  final int id;
  final String name;
  final String description;

  Activity({
    required this.id,
    required this.name,
    required this.description,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Activity && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}