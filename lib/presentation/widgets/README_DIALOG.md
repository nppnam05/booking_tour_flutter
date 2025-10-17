# Generic Selection Dialog với Awesome Dialog

## Tổng quan

Đây là implementation của Generic Selection Dialog sử dụng `awesome_dialog` package, có thể nhận vào list kiểu bất kỳ và có hàm display để convert từng phần tử thành string để hiển thị.

## Tính năng chính

✅ **Generic Type Support**: Có thể nhận vào list kiểu bất kỳ (String, int, custom class, enum, etc.)  
✅ **Display Function**: Hàm display để convert phần tử thành string  
✅ **Single & Multi Selection**: Hỗ trợ chọn một hoặc nhiều items  
✅ **Search Functionality**: Tìm kiếm trong list  
✅ **Beautiful UI**: Sử dụng awesome_dialog với animation đẹp  
✅ **Customizable**: Có thể tùy chỉnh màu sắc, text, animation  

## Cách sử dụng

### 1. Single Selection

```dart
// Với String
final selected = await GenericSelectionDialog.showSingleSelection<String>(
  context: context,
  title: 'Chọn trái cây',
  items: ['Táo', 'Chuối', 'Cam'],
  display: (fruit) => '🍎 $fruit',
);

// Với int
final selected = await GenericSelectionDialog.showSingleSelection<int>(
  context: context,
  title: 'Chọn số lượng',
  items: [1, 2, 3, 4, 5],
  display: (number) => '$number người',
);

// Với custom class
final selected = await GenericSelectionDialog.showSingleSelection<Activity>(
  context: context,
  title: 'Chọn hoạt động',
  items: activities,
  display: (activity) => '${activity.name} - ${activity.description}',
);
```

### 2. Multi Selection

```dart
// Với String
final selected = await GenericSelectionDialog.showMultiSelection<String>(
  context: context,
  title: 'Chọn điểm đến',
  items: ['Hà Nội', 'HCM', 'Đà Nẵng'],
  display: (destination) => '✈️ $destination',
);

// Với custom class
final selected = await GenericSelectionDialog.showMultiSelection<Service>(
  context: context,
  title: 'Chọn dịch vụ',
  items: services,
  display: (service) => '${service.name} - ${service.price}',
  preSelectedItems: [service1, service2], // Optional: pre-selected items
);
```

### 3. Notification Dialogs

```dart
// Dialog thông tin
await DialogNoti.showInfo(
  context: context,
  title: 'Thông tin',
  message: 'Đây là thông báo',
);

// Dialog thành công
await DialogNoti.showSuccess(
  context: context,
  title: 'Thành công',
  message: 'Thao tác hoàn thành!',
);

// Dialog lỗi
await DialogNoti.showError(
  context: context,
  title: 'Lỗi',
  message: 'Đã xảy ra lỗi',
);

// Dialog xác nhận
final result = await DialogNoti.showConfirm(
  context: context,
  title: 'Xác nhận',
  message: 'Bạn có chắc chắn?',
);

// Dialog cảnh báo
final result = await DialogNoti.showWarning(
  context: context,
  title: 'Cảnh báo',
  message: 'Hành động này không thể hoàn tác',
);
```

## Tùy chỉnh

### Custom Colors
```dart
final selected = await GenericSelectionDialog.showSingleSelection<String>(
  context: context,
  title: 'Chọn màu',
  items: colors,
  display: (color) => color,
  primaryColor: Colors.purple, // Custom primary color
  backgroundColor: Colors.grey[100], // Custom background
);
```

### Custom Animation
```dart
final selected = await GenericSelectionDialog.showSingleSelection<String>(
  context: context,
  title: 'Chọn item',
  items: items,
  display: (item) => item,
  dialogType: DialogType.success, // success, error, warning, info, noHeader
  animType: AnimType.slideInUp, // scale, slideInUp, slideInDown, etc.
);
```

## Custom Classes Example

```dart
class Activity {
  final int id;
  final String name;
  final String description;

  Activity({required this.id, required this.name, required this.description});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Activity && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

// Sử dụng
final activities = [
  Activity(id: 1, name: 'Tắm biển', description: 'Thư giãn trên bãi biển'),
  Activity(id: 2, name: 'Leo núi', description: 'Thử thách bản thân'),
];

final selected = await GenericSelectionDialog.showSingleSelection<Activity>(
  context: context,
  title: 'Chọn hoạt động',
  items: activities,
  display: (activity) => '${activity.name} - ${activity.description}',
);
```


## Lợi ích

1. **Không cần convert lung tung**: Chỉ cần truyền list và hàm display
2. **Type Safe**: Sử dụng generic để đảm bảo type safety
3. **Reusable**: Có thể dùng cho mọi kiểu dữ liệu
4. **Beautiful**: UI đẹp với awesome_dialog
5. **Flexible**: Nhiều tùy chọn customization
6. **Easy to use**: API đơn giản, dễ sử dụng

## Dependencies

```yaml
dependencies:
  awesome_dialog: ^3.3.0
```
